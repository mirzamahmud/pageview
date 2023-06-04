import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pageview/controller/home_screen_controller.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(controller.tabList.length, (index) => InkWell(
            onTap: (){
              controller.changeSelectedIndex(index);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              padding: const EdgeInsetsDirectional.symmetric(vertical: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: index == controller.selectedIndex ? Colors.black : Colors.transparent,
                    width: index == controller.selectedIndex ? 2 : 0
                  )
                )
              ),
              child: Text(controller.tabList[index], style: TextStyle(
                color: index == controller.selectedIndex ? Colors.black : Colors.grey.withOpacity(0.5),
                fontSize: 14,
                fontWeight: index == controller.selectedIndex ? FontWeight.w600 : FontWeight.w400
              ), textAlign: TextAlign.center),
            ),
          )),
        ),
      ),
    );
  }
}