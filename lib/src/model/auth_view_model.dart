import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/src/Repository/Auth/auth_repository.dart';

import '../Utils/genral/util.dart';

class AuthviewModel with ChangeNotifier {
  final authRepo = AuthRepository();

  Future<void> loginApi({dynamic data, required BuildContext context}) async {
    authRepo.loginAPi(data: data, context: context).then((value) {
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flushBarErrorMessage(message: error.toString(), context: context);
        print(error.toString());
      }
    });
  }
}
