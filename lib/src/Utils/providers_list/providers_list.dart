import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../model/auth_view_model.dart';
import '../../model/dashbaord/employee_view_model.dart';

class ProvidersList {
  static List<SingleChildWidget> providerList = [
    ChangeNotifierProvider(create: (_) => AuthviewModel()),
    ChangeNotifierProvider(create: (_) => EmployeViewProvider())
  ];
}
