// ignore_for_file: prefer_const_declarations, non_constant_identifier_names

import '../const/const.dart';

class AppImages {
  static final assetPath = "${Const.server}asset/path/on/server";
  static final serverStoragePath = "${Const.server}storage/";
  static final remoteAsset = "${Const.assetServer}uc?export=download&id=";
  static const svgAssets = "assets/svg/";
  static const pngAssets = "assets/png/";

  static final banner_logo = "${remoteAsset}12yvqV8Gmvix13J7IkgiaUVVGSIDsb6zJ";
  static final cartImage = "${svgAssets}cartIcon.svg";
  static final flutter_logo = "${pngAssets}logo_icon.png";
}
