import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventsy/Screens/ImageSearchPage/Service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../Controller/image_search_ui_controller.dart';
import '../Views/image_details_show.dart';
import '../Service/api_service.dart';
import 'package:connectivity/connectivity.dart';

// ignore: must_be_immutable
class ImageShowView extends StatefulWidget {
  bool shouldShowImages;
  ImageShowView({
    Key? key,
    required this.shouldShowImages,
  }) : super(key: key);

  @override
  _ImageShowViewState createState() => _ImageShowViewState(shouldShowImages);
}

class _ImageShowViewState extends State<ImageShowView> {
  bool hasInternet = true;
  bool shouldShowImages = true; // Initialize it to true
  late bool initialLoad = true;
  _ImageShowViewState(this.shouldShowImages);
  SimpleUIController homeController = Get.put(SimpleUIController());

  @override
  void initState() {
    super.initState();
    checkInternetConnectivity();
  }

  Future<void> checkInternetConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  setState(() {
    hasInternet = connectivityResult != ConnectivityResult.none;
    if (hasInternet) {
      shouldShowImages = true; // Set shouldShowImages to true when there's internet.
    }
  });
}


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    ApiService().getMethod(
      "https://api.unsplash.com/photos/?per_page=3000&order_by=latest&client_id=mZWpG8t2oknfFn6q6pxu5Ry92G1jxkML_Z_YFPTcBOY",
      headers: {},
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              /// AppBar
              MyAppBar(
                size: size,
                homeController: homeController,
              ),

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
                      child: Obx(() {
                        if (!hasInternet) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/Images/ImageSearch/no_internet.png',
                                  width: 200,
                                  height: 200,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "No internet connection.",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        if (homeController.isLoading.value) {
                          shouldShowImages = true;
                          return Center(
                            child: LoadingAnimationWidget.flickr(
                              rightDotColor: Colors.black,
                              leftDotColor: const Color(0xfffd0079),
                              size: 30,
                            ),
                          );
                        } else if (homeController.photos.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/Images/ImageSearch/6684393.jpg',
                                  width: 100,
                                  height: 100,
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "No images available.",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return shouldShowImages
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
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
                                    childrenDelegate:
                                        SliverChildBuilderDelegate(
                                      (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (ctx) => DetailView(
                                                  index: index,
                                                  homeController:
                                                      homeController,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: homeController
                                                .photos[index].id!,
                                            child: Container(
                                              margin: const EdgeInsets.all(2),
                                              child: CachedNetworkImage(
                                                imageUrl: homeController
                                                    .photos[index]
                                                    .urls!['small']!,
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child: LoadingAnimationWidget
                                                      .flickr(
                                                    rightDotColor: Colors.black,
                                                    leftDotColor:
                                                        const Color(0xfffd0079),
                                                    size: 25,
                                                  ),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(
                                                  Icons
                                                      .image_not_supported_rounded,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      childCount: homeController.photos.length,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/Images/ImageSearch/noimage.jpg',
                                        width: 200,
                                        height: 200,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "Please Search images as You Want.",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                        }
                      }),
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
    return Container();
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
    required this.size,
    required this.homeController,
  }) : super(key: key);

  final Size size;
  final SimpleUIController homeController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        width: size.width,
        height: size.height / 2.5,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
            image: const AssetImage('assets/Images/ImageSearch/search.jpg'),
            fit: BoxFit.cover,
          ),
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
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  width: double.infinity,
                  height: 50,
                  child: TextField(
                    readOnly: false,
                    onChanged: (value) {
                      homeController.searchQuery = value;
                    },
                    onSubmitted: (value) {
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
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 131, 131, 131),
                      ),
                    ),
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
