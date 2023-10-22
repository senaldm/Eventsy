import 'dart:developer';
import 'package:get/get.dart';

import '../Model/image_model.dart';
import '../Service/api_service.dart';
import 'package:connectivity/connectivity.dart'; 

class SimpleUIController extends GetxController {
  
  RxList<PhotosModel> photos = RxList();
  RxBool isLoading = true.obs;
  RxString orderBy = "latest".obs;
  RxString apikey = "mZWpG8t2oknfFn6q6pxu5Ry92G1jxkML_Z_YFPTcBOY".obs;
  var selectedIndex = 0.obs;
  List<String> validKeywords = [
    'Event',
    'Conference',
    'Seminar',
    'Workshop',
    'Trade Show',
    'Exhibition',
    'Festival',
    'Concert',
    'Meeting',
    'Convention',
    'Speaker',
    'Schedule',
    'Venue',
    'Flower',
    'Tickets',
    'Theme',
    'Entertainment',
    'Catering',
    'Table',
    'Beach function',
    'Outdoor function',
    'Outdoor wedding',
    'Hall',
    'Guest List',
    'Decoration',
    'Wedding',
    'Stage',
    'Program',
    'Birthday',
    'Ceromony',
    'Party',
    'Invitations',
    'Suits',
    'Exhibitors',
    'Awards',
    'Red Carpet',
    'cloths',
    'cakes',
    'Backstage',
    'Food menu',
    'lights',
    'glass',
    'Lighting',
    'Sound System',
    'Team',
    'Volunteer',
    'Event Planner',
    'Swag Bags',
    'Photo Booth',
    'Agenda',
    'Breakout Sessions',
    'Vendor Booths',
    'Collaborations',
    'Sponsor Booths',
    'Branding',
    'Awards Ceremony',
    'Award Nominations',
    'Art Gallery',
    'Auction',
    'Product Launch',
    'Book Signing',
    'Food Tasting',
    'Holiday Celebration',
    'Graduation Ceremony',
    'Family Reunion',
    'Retreat',
    'Stage Manager',
    'Concert Venue',
    'Virtual Events',
    'Hybrid Events',
    // Add more valid keywords here
  ];

  String searchQuery = "";
Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
  Future <void> searchPhotos() async {
     bool hasInternet = await checkInternetConnectivity(); // Check for internet connectivity

    if (!hasInternet) {
      // Handle no internet connection (e.g., show an error message)
      photos.clear();
      isLoading.value = false;
      return;
    }
    if (searchQuery.isNotEmpty) {
      // Check if the search query contains any valid keywords
      List<String> searchWords = searchQuery.toLowerCase().split(' ');
      bool isValidKeyword = false;
      for (String keyword in validKeywords) {
        if (searchWords.any((word) => word.contains(keyword.toLowerCase()))) {
          isValidKeyword = true;
          break;
        }
      }

      if (isValidKeyword) {
        isLoading.value = true;
        ApiService().getMethod(
          "https://api.unsplash.com/search/photos/?per_page=30&query=$searchQuery&client_id=${apikey.value}",
          headers: {},
        ).then((response) {
          photos.clear();
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
      } else {
        // Display an error message or show a specific image
        // indicating that the search query is not valid
        photos.clear();
        isLoading.value = false;
      }
    }
  }

  /// Get Picture
  getPictureData() async {
    isLoading.value = true;
    var headers = {
      'Authorization':
          'Client-ID ${apikey.value}', // Add the API key in headers
      'Content-Type': 'application/json',
    };
    var response = await ApiService().getMethod(
        "https://api.unsplash.com/photos/?per_page=30&order_by=popular&client_id=mZWpG8t2oknfFn6q6pxu5Ry92G1jxkML_Z_YFPTcBOY",
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

  Future<void> refreshData() async {
    // Implement your data refresh logic here.
    await searchPhotos();
  }
}
