import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/screen_two.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.deepPurple,
    appBarTheme: AppBarTheme(backgroundColor: Colors.amber),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.orange),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        // backgroundColor: Colors.deepPurple,
      ),
      // bottomSheet: BottomSheet(
      //   onClosing: () {},
      //   builder: (context) => const Text('Bottom Sheet'),
      // ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Card(
          //   child: ListTile(
          //     title: const Text('Getx Dialog Alert'),
          //     subtitle: const Text('Getx Dialog subtitle'),
          //     onTap: () {
          //       Get.defaultDialog(
          //           title: "Getx Dialog Alert",
          //           titlePadding: const EdgeInsets.only(top: 20),
          //           middleText: "Getx Dialog subtitle",
          //           contentPadding: const EdgeInsets.all(16),
          //           confirm: TextButton(
          //               onPressed: () {
          //                 Get.back();
          //               },
          //               child: const Text('Ok')),
          //           cancel: TextButton(
          //             onPressed: () {
          //               Get.back();
          //             },
          //             child: const Text('Cancel'),
          //           ));
          //     },
          //   ),
          // ),
          // Card(
          //   child: ListTile(
          //     title: const Text('Getx Bottom sheet'),
          //     subtitle: const Text('Getx Bottom Sheet'),
          //     onTap: () {
          //       Get.bottomSheet(Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           // color: Colors.blue,
          //         ),
          //         child: Column(children: [
          //           ListTile(
          //             leading: const Icon(Icons.light_mode_outlined),
          //             title: const Text('Light Theme'),
          //             onTap: () {
          //               Get.changeTheme(theme);
          //             },
          //           ),
          //           ListTile(
          //             leading: const Icon(Icons.dark_mode_outlined),
          //             title: const Text('Dark Theme'),
          //             onTap: () {
          //               Get.changeTheme(theme);
          //             },
          //           ),
          //         ]),
          //       ));
          //     },
          //   ),
          // ),
          // TextButton(onPressed: (){
          //   // Get.to(const ScreenTwo(name: 'some name'));
          //   Get.toNamed('/screen_two', arguments: ['Mohsin Ali']);
          // }, child: const Text('Goto Next'))

          ListTile(
            title: Text('message'.tr),
            subtitle: Text('name'.tr),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('ar', 'SA'));
                  },
                  child: const Text('Arabic')),
              const SizedBox(
                width: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(Locale('en', 'US'));
                  },
                  child: const Text('English')),
            ],
          )
        ],
      ),
    );
  }
}
