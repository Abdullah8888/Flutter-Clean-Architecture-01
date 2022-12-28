import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smart_phones_app/data/api_constant.dart';
import 'package:smart_phones_app/domain/entities/smart_phone.dart';
import 'package:smart_phones_app/extensions/extensions.dart';

abstract class RemoteDataSource {
  Future<List<SmartPhone>> getSmartPhones();
  Future<Product> getSmartPhones2();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});
  @override
  Future<List<SmartPhone>> getSmartPhones() async {
    final response = await client.get(Uri.parse(ApiConstant.fullUrl));
    if (response.statusCode.isBetween(200, 300)) {
      List<SmartPhone> smartPhoneModel = [];
      var data = json.decode(response.body)['products'];
      for (Map<String, dynamic> i in data) {
        smartPhoneModel.add(SmartPhone.fromJson(i));
      }
      return smartPhoneModel;
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Product> getSmartPhones2() async {
    final response = await client.get(Uri.parse(ApiConstant.fullUrl));
    if (response.statusCode.isBetween(200, 300)) {
      var data = json.decode(response.body);
      final result = Product.fromJson(data);
      print('res nos is $result');
      return result;
    } else {
      throw UnimplementedError();
    }
  }
}

// Wanna use this for generict api request via https
abstract class RemoteDataSource2 {
  Future<List<SmartPhone>> getSmartPhones();
  //(Response response, T Function(Map<String, dynamic>) mapper)
  Future<T> apiRequest<T>(
    String endPoint,
    RequestMethod method,
    T Function(Object json) fromJson, {
    String body = '',
    String token = '',
  });
}

enum RequestMethod { get, post, put, delete }

enum RequestMethod2 { get, post, put, delete }

// Wanna use this for generic api request via dio
abstract class ApiResult<T> {
  static ApiResult<T> fromResponse<T>(
      RequestMethod2 method, T Function(Map<String, dynamic>) mapper) {
    // TODO: implement fromResponse
    throw UnimplementedError();
  }
}
