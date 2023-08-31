import 'package:transisi_apps/core/utils/constants.dart';

class Utils {
  Utils._();

  static String iconPath(String iconName) {
    return '${Constants.assetIconPath}/$iconName';
  }

  static String imagePath(String imageName) {
    return '${Constants.assetImagePath}/$imageName';
  }
}
