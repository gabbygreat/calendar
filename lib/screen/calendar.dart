import 'package:flutter/material.dart';
import 'package:paint/utils/calendar_widget/calendar_widget.dart';
import 'package:paint/utils/constants/base.dart';
import 'package:paint/utils/constants/color.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      backgroundColor: backgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: padding * 0.5,
        ),
        height: MediaQuery.of(context).size.height * 0.7,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            SizedBox(
              height: padding * 3,
            ),
            Expanded(
              child: CalendarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
