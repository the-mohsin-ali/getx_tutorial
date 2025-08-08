import 'package:get/get.dart';

class FavouriteController extends GetxController{

  RxList<String> favourites = ['mango', 'apple', 'banana', 'kaddu'].obs;
  RxList tempFavoutires = [].obs;

  addToFavourites(String value){
    tempFavoutires.add(value);
  }

  removeFromFavourites(String value){
    tempFavoutires.remove(value);
  }

}