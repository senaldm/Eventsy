import 'dart:developer';
import 'package:get/get.dart';

import '../Model/image_model.dart';
import '../Service/api_service.dart';

class SimpleUIController extends GetxController {
  RxList<PhotosModel> photos = RxList();
  RxBool isLoading = true.obs;
  RxString orderBy = "latest".obs;
  RxString apikey = "mZWpG8t2oknfFn6q6pxu5Ry92G1jxkML_Z_YFPTcBOY".obs;
  var selectedIndex = 0.obs;
  List<String> orders = [
    "latest",
    "popular",
    "oldest",
    "views",
  ];

 String searchQuery = ""; 
 searchPhotos() {
    if (searchQuery.isNotEmpty) {
      isLoading.value = true;
      ApiService().getMethod(
        "https://api.unsplash.com/search/photos/?per_page=3000&query=$searchQuery&client_id=$apikey",
        headers: {},
      ).then((response) {
        photos.clear(); // Clear existing photos
        if (response.statusCode == 200) {
          response.data['results'].forEach((element) {
            photos.add(PhotosModel.fromJson(element));
          });
          isLoading.value = false;
        }
      }).catchError((error) {
        print("Error fetching search results: $error");
        isLoading.value = false;
      });
    }
  }

  /// Get Picture 
 getPictureData() async {
  isLoading.value = true;
  var headers = {
    'Authorization': 'Client-ID ${apikey.value}', // Add the API key in headers
    'Content-Type': 'application/json',
  };
  var response = await ApiService().getMethod(
      "https://api.unsplash.com/photos/?per_page=3000&order_by=popular&client_id=mZWpG8t2oknfFn6q6pxu5Ry92G1jxkML_Z_YFPTcBOY",
      headers: headers); // Pass headers to the ApiService call
  photos = RxList();
  if (response.statusCode == 200) {
    response.data.forEach((element) {
      photos.add(PhotosModel.fromJson(element));
    });
    isLoading.value = false;
  }
}


  /// changing order value
  ordersFunc(String newVal) {
    orderBy.value = newVal;
    getPictureData();
  }

  @override
  void onInit() {
    getPictureData();
    super.onInit();
  }
}