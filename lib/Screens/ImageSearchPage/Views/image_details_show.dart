import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Controller/image_search_ui_controller.dart';

class DetailView extends StatelessWidget {
  DetailView({Key? key, required this.index, required SimpleUIController homeController}) : super(key: key);
  final int index;

  SimpleUIController homeController = Get.find<SimpleUIController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900, // Set the background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center vertically
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white, // Set the background color for the image
            child: CachedNetworkImage(
              imageUrl: homeController.photos[index].urls!['regular']!,
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                fit: BoxFit.fitWidth, // Fit the image to width
              ),
              placeholder: (context, url) => Center(
                child: LoadingAnimationWidget.flickr(
                  rightDotColor: Colors.black,
                  leftDotColor: const Color(0xfffd0079),
                  size: 35,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.image_not_supported_rounded,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 10), // Add spacing between the image and text
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black.withOpacity(0.5),
            child: Text(
              homeController.photos[index].createdAt!
                  .substring(0, 10)
                  .replaceAll("-", " / "),
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
