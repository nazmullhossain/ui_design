import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:torch_light/torch_light.dart';
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
  void powerSwitchChanged(bool value, int index  ) {
    setState(() {
      mySmartDevice[index][2] = value;
    });
  }

  void tochLight()async{
    // Enable torch and manage all kind of errors
    try {
      await TorchLight.enableTorch();
    } on EnableTorchExistentUserException catch (e) {
      // The camera is in use
    } on EnableTorchNotAvailableException catch (e) {
      // Torch was not detected
    } on EnableTorchException catch (e) {
      // Torch could not be enabled due to another error
    }

// Disable torch and manage all kind of errors
    try {
      await TorchLight.disableTorch();
    } on DisableTorchExistentUserException catch (e) {
      // The camera is in use
    } on DisableTorchNotAvailableException catch (e) {
      // Torch was not detected
    } on DisableTorchException catch (e) {
      // Torch could not be disabled due to another error
    }
  }


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
                children: [
                  Text("Welcome Home"),
                  Text(
                    "Mitch KOKO",
                    style: GoogleFonts.bebasNeue(fontSize: 72),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 25,
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
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                          iconPath: mySmartDevice[index][1],
                          powerOn: mySmartDevice[index][2],
                          smartDeviceName: mySmartDevice[index][0],
                          onChanged: (value) =>
                              powerSwitchChanged(value, index));
                    }))
          ],
        ),
      ),
    );
  }
}
