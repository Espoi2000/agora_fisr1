import 'package:cached_network_image/cached_network_image.dart';
import 'package:debut_pratique/todo_list/simple_show_image_gird.dart';
import 'package:debut_pratique/todo_list/staggered_grid.dart';
import 'package:debut_pratique/feature/presentation/view/add_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          color: Colors.white,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 1.5,
                    child: PageView.builder(
                        itemCount: 3,
                        controller: pageController,
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.sizeOf(context).height / 2.5,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://picsum.photos/${index}00",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      Colors.red,
                                                      BlendMode.colorBurn)),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          const SizedBox(
                                              child:
                                                  CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  "Titre 1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Ask Claude to generate content like code snippets, text documents, or website designs, and Claude will create an Artifact that appears in a dedicated window alongside your conversation.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Positioned(
                    bottom: 0,
                    right: MediaQuery.sizeOf(context).width / 2.5 - 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (value) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            margin: const EdgeInsets.only(right: 10),
                            height: 15,
                            width: currentPage == value ? 30 : 15,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(40),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: TextButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.green,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const StraggeredScreen()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Passer",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
