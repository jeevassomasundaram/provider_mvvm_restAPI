import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/src/Data/Network/base_api_services.dart';
import 'package:provider_with_mvvm/src/Data/Network/network_api_services.dart';
import 'package:provider_with_mvvm/src/Data/local%20data/prefrence.dart';
import 'package:provider_with_mvvm/src/Resource/const/api.dart';

import '../../Utils/routes/routes_names.dart';

class AuthRepository {
  final BaseAPiServices _apiServices = NetowrkApiService();

 loginAPi({required dynamic data,required BuildContext context}) async {
    try {
      //  dynamic response = await _apiServices.getPostApiResponse(API.login, data);
      dynamic response = await _apiServices.httpPost(
          api: API.login,
          showLoader: true,
          parameters: data,
          success: (sucess) {
            if (kDebugMode) {
              Pref.setToken(token: sucess["token"]);
              print("login ${sucess["token"]}");
               Navigator.pushNamed(context, RoutesName.dashabord);
            }
          },
          failure: (error) {
            if (kDebugMode) {
              print("error is this $error");
            }
          });
     //  if you want to return somthing then we can return particualr things
      return response;
    } catch (e) {
      rethrow;
    }
  }


}
