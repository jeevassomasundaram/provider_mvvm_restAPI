import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_mvvm/src/Data/local%20data/prefrence.dart';

import '../../Utils/routes/routes_names.dart';
import '../../model/dashbaord/employee_view_model.dart';

class Dashbaord extends StatefulWidget {
  const Dashbaord({super.key});

  @override
  State<Dashbaord> createState() => _DashbaordState();
}

class _DashbaordState extends State<Dashbaord> {
  @override
  void initState() {
    super.initState();
    Provider.of<EmployeViewProvider>(context, listen: false).getEmployeeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashbaord'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Pref.clearAllData();
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: const Icon(Icons.logout)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<EmployeViewProvider>(
            builder: (context, value, child) {
              if (value.employeeList.isEmpty) {
                return const Center(child: Text("no data"));
              } else {
                return ListView.builder(
                  itemCount: value.employeeList.length,
                  itemBuilder: (context, index) {
                    final todo = value.employeeList[index];
                    return ListTile(
                      title: Text(todo.employeeName),
                    );
                  },
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
