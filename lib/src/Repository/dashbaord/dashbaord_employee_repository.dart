import 'package:flutter/foundation.dart';
import 'package:provider_with_mvvm/src/View/dashbaord/dashbaord_data_model/employee.dart';

import '../../Data/Network/base_api_services.dart';
import '../../Data/Network/network_api_services.dart';
import '../../Resource/const/api.dart';

class EmployeeDataRepository {
  final BaseAPiServices _apiServices = NetowrkApiService();
  List<Employee> dataList = [];
  Future<dynamic> getemployeeDetail() async {
    await _apiServices.httpGet(
        api: API.getemployee,
        success: (data) {
        // print("data comming $data");
          for (var i = 0; i < data["data"].length; i++) {
            dataList.add(Employee.fromJson(data["data"][i]));
          }
        },
        offlineSupport: true,
        offlineData: (offlineData) {
          if (dataList.isEmpty) {
            for (var i = 0; i < offlineData["data"].length; i++) {
              dataList.add(Employee.fromJson(offlineData["data"][i]));
            }
          }

          if (kDebugMode) {
            print("offline data $offlineData");
          }
        },
        showLoader: true,
        failure: (error) {
          if (kDebugMode) {
            print("somthing went wrong $error");
          }
        });
    return dataList;
  }
}
