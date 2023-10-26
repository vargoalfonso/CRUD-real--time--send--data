import 'package:get/get.dart';

class simpleCRUDcontroller extends GetxController{
  final _list = <String>[].obs;
  List<String> get list=> _list;

  add(String n){
    _list.add(n);
  }
   updateItem(int index, String n){
    _list[index] =  n;
   }
   deleter(int index){
    _list.removeAt(index);  
   }
   clearState(){
    Get.delete<simpleCRUDcontroller>(force: true);
   }
}