import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Repository/dashbaord/dashbaord_employee_repository.dart';
import '../../Utils/genral/util.dart';
import '../../View/dashbaord/dashbaord_data_model/employee.dart';

class EmployeViewProvider with ChangeNotifier {
  final employeeDataRepository = EmployeeDataRepository();
  List<Employee> _employeeList = [];

  List<Employee> get employeeList => _employeeList;
  Future<void> getEmployeeData() async {
    try {
      _employeeList = await employeeDataRepository.getemployeeDetail();
      print("length ${_employeeList.length}");
      notifyListeners();
    } catch (e) {
      Utils.toastMessage(message: e.toString());
    }
  }
}
