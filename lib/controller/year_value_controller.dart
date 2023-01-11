import 'package:get/get.dart';

class YearValueController extends GetxController {
  var year = "".obs;
  changeYearValue({required String yearValue}) {
    year.value = yearValue;
  }
}
