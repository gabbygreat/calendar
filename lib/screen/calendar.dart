import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:igbocalendar/utils/constants/base.dart';
import 'package:igbocalendar/utils/constants/color.dart';
import 'package:igbocalendar/utils/functions/functions.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime date = DateTime.now();
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
          children: [
            const SizedBox(
              height: padding * 3,
            ),
            TableCalendar(
              firstDay: DateTime.utc(1900),
              lastDay: DateTime.utc(2100),
              focusedDay: date,
              onPageChanged: (focusedDay) => date = focusedDay,
              daysOfWeekHeight: 50,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (context, day) => Center(
                  child: InkWell(
                    overlayColor: MaterialStateColor.resolveWith(
                        (states) => Colors.transparent),
                    onTap: () async {
                      var day = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (day != null) {
                        setState(() {
                          date = day;
                        });
                      }
                    },
                    child: Text(
                      DateFormat('MMMM yyyy').format(day),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                dowBuilder: (context, day) => Center(
                  child: Text(
                    DateFormat('EEE').format(day),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                outsideBuilder: (context, day, focusedDay) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      DateFormat('d').format(day),
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      getDayInIgbo(date: day),
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                todayBuilder: (context, day, focusedDay) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      DateFormat('d').format(day),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      getDayInIgbo(date: day),
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                defaultBuilder: (context, day, focusedDay) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      DateFormat('d').format(day),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      getDayInIgbo(date: day),
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
