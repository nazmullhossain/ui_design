import 'package:flutter/material.dart';
import 'package:ui_design_home/utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 25;
  final double verticalPadding = 20;

  List mySmartDevice = [
    ["Smart Light", "images/light-bulb.png", true],
    ["Smart Ac", "images/air-conditioner.png", false],
    ["Smart TV", "images/smart-tv.png", false],
    ["Smart Fan", "images/fan.png", false]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "images/menu.png",
                    height: 40,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: const [
                  Text("Welcome Home"),
                  Text(
                    "Mitch KOKO",
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: const Text("Smart Devices"),
            ),
            //welcome home MITCH koo

            // smart devices +grid

            Expanded(
                child: GridView.builder(
                    itemCount: mySmartDevice.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                        childAspectRatio: 1/1.3),
                    itemBuilder: (context, index) {
                      return  SmartDeviceBox(
                        iconPath: mySmartDevice[index][1],
                        powerOn: mySmartDevice[index][2],
                        smartDeviceName: mySmartDevice[index][0],
                        onChanged: (bool ) {  },);
                    }))
          ],
        ),
      ),
    );
  }
}
