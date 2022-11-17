import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
   SmartDeviceBox(
      {Key? key,
      required this.iconPath,
      required this.powerOn,
        required this.onChanged,
      required this.smartDeviceName})
      : super(key: key);

  final String smartDeviceName, iconPath;
  final bool powerOn;
  void Function(bool)?onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.grey[400], borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          children: [
            Image.asset(
              iconPath,
              height: 50,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    smartDeviceName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Expanded(
                  child: Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(value: powerOn, onChanged: onChanged),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
