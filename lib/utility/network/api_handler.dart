import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'error_handler.dart';

class ApiHandler {
  static GetConnect _getConnect = GetConnect();
  // Api without Token
  static Future<dynamic> get(String url) async {
    try {
      Response response = await _getConnect.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode);
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format");
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure");
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem");
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""));
    }
  }

  static Future<dynamic> post(url,{body}) async {
    try {
      Response response = await _getConnect.post(
        url,
        body,
        contentType: "multipart/form-data"
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode);
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format");
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure");
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem");
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""));
    }
  }
// Api with Token

}
