import 'package:chat_app/helpers/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(
            child: Image.asset(
              'lib/assets/images/company_logo.png',
              fit: BoxFit.fitHeight,
              height: 120.0,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: CustomColors.colorSecondary,
            child: ListView(
              shrinkWrap: true,
              children:
                  ListTile.divideTiles(color: CustomColors.colorMain, tiles: [
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  minLeadingWidth: 50.0,
                  title: const Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Get.offAllNamed("/");
                  },
                ),
              ]).toList(),
            ),
          ),
        ),
      ]),
    );
  }
}
