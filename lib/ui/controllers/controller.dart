import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetx/utility/network/api_handler.dart';
import 'package:testgetx/utility/network/error_handler.dart';
import '../../Config/config.dart';
import '../models/productModel.dart';

class ProductController extends GetxController with StateMixin<ProductModel> {
  List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  set productList(List<ProductModel> value) {
    _productList = value;
    update();
  }

  var _isLoading = false.obs;

  get isLoading => _isLoading.value;

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final qtyController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String editproductId = ''.obs();

  @override
  void onInit() {
    super.onInit();
    getProductList();
  }

  @override
  void onReady() {
    super.onInit();
    append(getProductList());
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    priceController.dispose();
    qtyController.dispose();
  }

  getProductList() async {
    try {
      await ApiHandler.get(
        Config.getProduct,
      ).then((value) async {
        if (value["status"] == "true") {
          final items = value["data"].cast<Map<String, dynamic>>();
          List<ProductModel> listofusers = items.map<ProductModel>((json) {
            return ProductModel.fromJson(json);
          }).toList();
          productList = [];
          productList.addAll(listofusers.reversed);
        } else {}
      });
    } on ErrorHandler catch (ex) {
      print(ex);
    }
  }

  setAddPagecntrlData(ProductModel productModel) {
    nameController.text = productModel.pname ?? "";
    priceController.text = productModel.price ?? "";
    qtyController.text = productModel.qty ?? "";
    editproductId = productModel.pid ?? "";
  }

  addProduct({bool isEdited = false}) async {
    FocusScope.of(Get.context!).unfocus();
    if (formKey.currentState!.validate()) {
      try {
        FormData form = FormData({
          "pid": editproductId,
          "pname": nameController.text,
          "qty": qtyController.text,
          "price": priceController.text,
        });
        await ApiHandler.post(isEdited ? Config.editProduct : Config.addProduct,
                body: form)
            .then((value) async {
          if (value["status"] == "true") {
            getProductList();
            Get.back();
            nameController.clear();
            qtyController.clear();
            priceController.clear();
          } else {}
        });
      } on ErrorHandler catch (ex) {
        print(ex);
      }
    }
  }

  deleteProduct({required pid}) async {

    FormData form = FormData({
      "pid":pid,
    });
    try {
      await ApiHandler.post(Config.deleteProduct, body: form).then((value) async {
        if (value["status"] == "true") {
          getProductList();
        } else {}
      });
    } on ErrorHandler catch (ex) {
      print(ex);
    }
  }
}
