import 'package:intl/intl.dart';
import 'package:transisi_apps/core/utils/constants.dart';

class Utils {
  Utils._();

  static String iconPath(String iconName) {
    return '${Constants.assetIconPath}/$iconName';
  }

  static String imagePath(String imageName) {
    return '${Constants.assetImagePath}/$imageName';
  }

  static String getExceptionMessage(Exception exception) {
    return exception.toString().replaceFirst("Exception: ", "");
  }

  static String convertDateTime(String formatter, String dateTime) {
    DateTime inputDate = DateTime.parse(dateTime);

    return DateFormat(formatter).format(inputDate);
  }
}
