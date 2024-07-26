import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/home/home_controller.dart';
import 'package:todoapp/theme/appcolors.dart';
import 'package:todoapp/utils/date_formatter_util.dart';

class Homeview extends StatelessWidget {
  Homeview({super.key});



  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          DateFormatterUtil().currentDate(),
          style: const TextStyle(fontSize: 16),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              CupertinoIcons.bell_solid,
              color: Appcolors.primary1,
              size: 30,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Text(
              "Welcome User",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              "Have a nice day !",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "My Priority Task",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Appcolors.black2,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.ptList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(
                          child: Text(
                        homeController.ptList[index]["title"].toString(),
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                    );
                    // return Text("Data is ${homeController.ptList[index]["title"]}");;
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Daily Task",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 400,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:Obx(
                    (){
                      return  ListView.builder(
                          shrinkWrap: true,
                          itemCount: homeController.dtList.length,
                          itemBuilder: (context, index) {

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Data is ${homeController.dtList[index]["title"]}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: homeController.isSelected(index)?Appcolors.black:Appcolors.primary,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      homeController.updateDtStatus(index);
                                    },
                                    icon: homeController.isSelected(index)?const Icon(Icons.circle_outlined):Icon(CupertinoIcons.checkmark_circle_fill,color: Appcolors.primary,))
                              ],
                            );
                          });
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
