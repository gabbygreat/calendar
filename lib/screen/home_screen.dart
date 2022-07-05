import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paint/screen/calendar.dart';
import 'package:paint/utils/clock/view/analog_clock.dart';
import 'package:paint/utils/clock/view/digital_clock.dart';
import 'package:paint/utils/constants/asset_path.dart';
import 'package:paint/utils/constants/base.dart';
import 'package:paint/utils/constants/color.dart';

class ClockApp extends StatefulWidget {
  const ClockApp({Key? key}) : super(key: key);

  @override
  State<ClockApp> createState() => _ClockAppState();
}

class _ClockAppState extends State<ClockApp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(
            left: padding,
            right: padding,
            top: padding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(
                flex: 1,
                // fit: FlexFit.tight,
                child: DigitalClockView(),
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: AnalogClockView(
                    size: size.width,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 8.0,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CalendarScreen(),
            ),
          ),
          child: SvgPicture.asset(
            svgLogo,
          ),
        ),
      ),
    );
  }
}
