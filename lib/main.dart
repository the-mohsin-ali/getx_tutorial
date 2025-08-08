import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/counter_controller.dart';
import 'package:getx_tutorial/favourite_controller.dart';
import 'package:getx_tutorial/image_controller.dart';
import 'package:getx_tutorial/languages.dart';
import 'package:getx_tutorial/login_screen.dart';
import 'package:getx_tutorial/scroller_controller.dart';
import 'package:getx_tutorial/switch_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var getPages = [
    //   GetPage(name: '/', page: () => const HomeScreen()),
    //   GetPage(name: '/screen_two', page: () => ScreenTwo()),
    //   GetPage(name: '/screen_three', page: () => const ScreenThree()),
    // ];
    return GetMaterialApp(
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      translations: Languages(),
      title: 'Flutter Demo',
      theme: ThemeData.light(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const LoginScreen(),
      // getPages: getPages,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterController controller = Get.put(CounterController());

  final ScrollerController scrollController = Get.put(ScrollerController());

  final SwitchConroller switchConroller = Get.put(SwitchConroller());

  final FavouriteController favouriteController =
      Get.put(FavouriteController());

  final ImageController imageController = Get.put(ImageController());

  // int _counter = 0;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Obx(() => Container(
                height: 200,
                width: 200,
                color: Colors.red
                    .withValues(alpha: scrollController.opacity.value),
              )),
          Obx(() => Slider(
                onChanged: (value) {
                  scrollController.setOpacity(value);
                },
                value: scrollController.opacity.value,
              )),
          const SizedBox(
            height: 30,
          ),
          Obx(() => Switch(
                onChanged: (value) => switchConroller.setNotification(value),
                value: switchConroller.switchValue.value,
              )),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: favouriteController.favourites.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        if (favouriteController.tempFavoutires.contains(
                            favouriteController.favourites[index].toString())) {
                          favouriteController.removeFromFavourites(
                              favouriteController.favourites[index].toString());
                        } else {
                          favouriteController.addToFavourites(
                              favouriteController.favourites[index].toString());
                        }
                      },
                      title: Text(favouriteController.favourites[index]),
                      trailing: Obx(() {
                        return Icon(
                          Icons.favorite,
                          color: favouriteController.tempFavoutires.contains(
                                  favouriteController.favourites[index]
                                      .toString())
                              ? Colors.red
                              : Colors.white,
                        );
                      }),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: imageController.imagePath.isNotEmpty
                        ? FileImage(File(imageController.imagePath.toString()))
                        : null,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      imageController.getImage();
                    },
                    child: const Text('Pick Image')),
              ],
            );
          }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
