import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';

class AddProduct extends StatelessWidget {
  final bool isEdited;
  final ProductController _controller = Get.find();

  AddProduct({this.isEdited = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        elevation: 0.0,
        bottomOpacity: 0.05,
        title: Text(
          'Add Post',
        ),
      ),
      body: Obx(
        () => _controller.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _controller.nameController,
                        keyboardType: TextInputType.text,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Name";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                          labelText: "Name",
                          hintText: "Enter Name",
                          fillColor: Colors.white,
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          labelStyle: const TextStyle(color: Colors.black),
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _controller.priceController,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Price";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                          labelText: "Price",
                          hintText: "Enter Price",
                          fillColor: Colors.white,
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          labelStyle: const TextStyle(color: Colors.black),
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _controller.qtyController,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter QTY";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        decoration: InputDecoration(
                          labelText: "QTY",
                          hintText: "Enter QTY",
                          fillColor: Colors.white,
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          labelStyle: const TextStyle(color: Colors.black),
                          hintStyle: const TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: ()=> _controller.addProduct(isEdited: isEdited),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
