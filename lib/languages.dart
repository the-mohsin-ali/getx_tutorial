import 'package:get/get.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_Us':{
      'name' : 'English',
      'message': 'Hello World',
    },
    'ar_SA':{
      'name' : 'العربية',
      'message': 'مرحبا بالعالم',
    }
  };
}