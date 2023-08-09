import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventsy/Screens/ImageSearchPage/Service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../Controller/image_search_ui_controller.dart';
import '../Views/image_details_show.dart';
// ignore: duplicate_import
import '../Service/api_service.dart';

// ignore: must_be_immutable
class ImageShowView extends StatelessWidget {
  ImageShowView({
    Key? key,
  }) : super(key: key);

  SimpleUIController homeController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    ApiService().getMethod(
        "https://api.unsplash.com/photos/?per_page=3000&order_by=latest&client_id=mZWpG8t2oknfFn6q6pxu5Ry92G1jxkML_Z_YFPTcBOY",
        headers: {});
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              /// AppBar
              MyAppBar(size: size),

              /// Main Body
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),

                    /// TapBar
                    Expanded(flex: 1, child: _buildTabBar()),
                    const SizedBox(
                      height: 25,
                    ),

                    /// Pictures
                    Expanded(
                      flex: 13,
                      child: Obx(
                        () => homeController.isLoading.value
                            ? Center(
                                child: LoadingAnimationWidget.flickr(
                                  rightDotColor: Colors.black,
                                  leftDotColor: const Color(0xfffd0079),
                                  size: 30,
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: GridView.custom(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate: SliverQuiltedGridDelegate(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                    repeatPattern:
                                        QuiltedGridRepeatPattern.inverted,
                                    pattern: const [
                                      QuiltedGridTile(2, 2),
                                      QuiltedGridTile(1, 1),
                                      QuiltedGridTile(1, 1),
                                      QuiltedGridTile(1, 2),
                                    ],
                                  ),
                                  childrenDelegate: SliverChildBuilderDelegate(
                                      childCount: homeController.photos.length,
                                      (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (ctx) =>
                                                DetailView(index: index),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: homeController.photos[index].id!,
                                        child: Container(
                                          margin: const EdgeInsets.all(2),
                                          child: CachedNetworkImage(
                                            imageUrl: homeController
                                                .photos[index].urls!['small']!,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Center(
                                              child:
                                                  LoadingAnimationWidget.flickr(
                                                rightDotColor: Colors.black,
                                                leftDotColor:
                                                    const Color(0xfffd0079),
                                                size: 25,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(
                                              Icons.image_not_supported_rounded,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: homeController.orders.length,
        itemBuilder: (ctx, i) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                homeController.selectedIndex.value = i;
                homeController.ordersFunc(homeController.orders[i]);
              },
              child: AnimatedContainer(
                  margin: EdgeInsets.fromLTRB(i == 0 ? 15 : 5, 0, 5, 0),
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(
                        i == homeController.selectedIndex.value ? 18 : 15)),
                    color: i == homeController.selectedIndex.value
                        ? Colors.grey[700]
                        : Colors.grey[200],
                  ),
                  duration: const Duration(milliseconds: 300),
                  child: Center(
                    child: Text(
                      homeController.orders[i],
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        color: i == homeController.selectedIndex.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  )),
            ),
          );
        });
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: size.width,
        height: size.height / 3.5,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   colorFilter: ColorFilter.mode(
            //       Colors.black.withOpacity(0.3), BlendMode.darken),
            //   image: const AssetImage(""),
            //   fit: BoxFit.cover,
            // ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  "What would you like\n to Find?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    readOnly: false,
                    onChanged: (value) {
                      var homeController;
                      homeController.searchQuery = value;
                    },
                    onSubmitted: (value) {
                       var homeController;
                      homeController.searchPhotos();
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 228, 228, 228),
                        contentPadding: const EdgeInsets.only(top: 5),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 20,
                          color: Color.fromARGB(255, 146, 146, 146),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
                        hintText: "Search",
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 131, 131, 131))),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}