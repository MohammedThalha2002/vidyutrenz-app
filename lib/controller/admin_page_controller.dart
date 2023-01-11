import 'package:get/get.dart';

class AdminPageController extends GetxController {
  var selected = 1.obs;

  changing(int count) {
    selected.value = count;
  }
}
