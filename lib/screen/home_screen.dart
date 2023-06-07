import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pageview/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final PageController pageController = PageController(initialPage: 0, viewportFraction: 1);

  @override
  void initState() {
    
    Get.put(HomeScreenController());
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        builder: (controller) => SafeArea(
        child: DefaultTabController(
          length: controller.tabList.length,
          child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text("Pageview Vertical Scroll", style: TextStyle(
                color: Colors.black,
                fontSize: 16
              )),
              titleSpacing: 0,
              leading: InkWell(
                onTap: (){},
                child: const Icon(Icons.menu, color: Colors.black, size: 16),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: (){},
                    child: const Icon(Icons.shop, color: Colors.black, size: 16),
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 50),
                child: TabBar(
                  isScrollable: true,
                  tabs: List.generate(controller.tabList.length, (index) => Tab(
                    child: Text(
                        controller.tabList[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black)
                    ),
                  )),
                  onTap: (value){
                    controller.changeSelectedIndex(value);
                  },
                ),
              ),
            ),
            body: RotatedBox(
              quarterTurns: 1,
              child: TabBarView(
                children: List.generate(controller.colorList.length, (index) => Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: controller.colorList[index]
                  ),
                  child: Text(
                    controller.tabList[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white)
                  ),
                )),
              ),
            )




            /*PageView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              itemCount: controller.colorList.length,
              itemBuilder: (context, index) => Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: controller.colorList[index]
                ),
              ),
              onPageChanged: (value) {
                controller.changeSelectedIndex(value);
              },
            )*/
          ),
        ),
      )
    );
  }
}