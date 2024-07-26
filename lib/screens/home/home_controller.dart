
import 'package:get/get.dart';
import 'package:todoapp/screens/home/home_model.dart';
import 'package:todoapp/services/db_service/db_service.dart';



class HomeController extends GetxController {
  HomeModel homeModel = HomeModel();
  List<Map<String, dynamic>> ptList = [];
  RxList<Map<String, dynamic>> dtList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getPTList();
    getDTList();
    super.onInit();
  }

  void getPTList() async {
    ptList = await DbService().fetchPtTable();
  }

  void getDTList() async {
    List<Map<String, dynamic>> fetchedData = await DbService().fetchDtTable();
    dtList.assignAll(fetchedData);

  }

  void updateDtStatus(int index) async {
    if (dtList[index]["status"] == "true") {
      dtList[index]["status"]="false";
      await DbService().updateDtStatus(index, "false");
      getDTList();
    }
    if (dtList[index]["status"] == "false") {
      await DbService().updateDtStatus(index, "true");
      getDTList();
    }
  }

  bool isSelected(int index) {
    if (dtList[index]["status"] == "true") {
      return true;
    } else {
      return false;
    }
  }
}
