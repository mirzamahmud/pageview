import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController{

  HomeScreenController();

  List<String> tabList = [
    "AC Servicing",
    "AC Cooling Problem",
    "AC Installation",
    "AC Hanging",
    "LCD/LED/Smart TV Repair",
    "Microwave Repair Service",
    "Refrigerator Repair",
    "Washing Machine Repair",
    "Ambulance Service",
    "Laptop & Desktop Repair"
  ];
  List<Color> colorList = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.amber,
    Colors.pink,
    Colors.black,
    Colors.grey,
  ];
  int selectedIndex = 0;
  void changeSelectedIndex(int index){
    selectedIndex = index;
    print("Selected Index: $selectedIndex");
    update();
  }
}