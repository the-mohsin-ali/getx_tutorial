import 'package:get/get.dart';

class SwitchConroller extends GetxController{
  RxBool switchValue = false.obs;

  setNotification(bool value){
    switchValue.value = value;
    print(switchValue.value);
  }
}