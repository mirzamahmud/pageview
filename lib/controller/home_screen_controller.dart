import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{

  HomeScreenController();

  List<String> tabList = ["Overview", "FAQ", "Recent View"];
  List<Color> colorList = [Colors.green, Colors.red, Colors.blue];
  int selectedIndex = 0;

  void changeSelectedIndex(int index){

    selectedIndex = index;
    update();
  }
}