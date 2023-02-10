// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:paint/utils/constants/color.dart';
import 'package:paint/utils/datepicker/date_picker/date_picker.dart';
import 'package:paint/utils/datepicker/date_picker/date_picker_manager.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      selectionShape: DateRangePickerSelectionShape.rectangle,
      selectionColor: whiteColor.withOpacity(0.2),
      selectionTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      todayHighlightColor: whiteColor,
      showNavigationArrow: true,
      headerStyle: DateRangePickerHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: TextStyle(
          fontSize: 25,
          color: whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      monthCellStyle: DateRangePickerMonthCellStyle(
        cellDecoration: _MonthCellDecoration(
          backgroundColor: whiteColor.withOpacity(0.2),
          showIndicator: false,
          indicatorColor: hourColorB,
        ),
        todayCellDecoration: _MonthCellDecoration(
          // borderColor: whiteColor,
          backgroundColor: whiteColor.withOpacity(0.2),
          showIndicator: false,
          indicatorColor: Colors.green,
        ),
        specialDatesDecoration: _MonthCellDecoration(
          backgroundColor: minColorB,
          showIndicator: false,
          indicatorColor: minColorA,
        ),
        disabledDatesTextStyle: const TextStyle(
          color: Color(0xffe2d7fe),
        ),
        weekendTextStyle: TextStyle(
          color: whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        textStyle: TextStyle(
          color: whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        specialDatesTextStyle: TextStyle(
          color: whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        todayTextStyle: TextStyle(
          color: minColorB,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      yearCellStyle: DateRangePickerYearCellStyle(
        todayTextStyle: TextStyle(
          color: hourColorB,
          fontSize: 14,
        ),
        textStyle: TextStyle(
          color: whiteColor,
          fontSize: 14,
        ),
        disabledDatesTextStyle: const TextStyle(
          color: Color(0xffe2d7fe),
        ),
        leadingDatesTextStyle: const TextStyle(
          color: Colors.red,
          fontSize: 14,
        ),
      ),
      monthViewSettings: DateRangePickerMonthViewSettings(
        firstDayOfWeek: 1,
        viewHeaderStyle: DateRangePickerViewHeaderStyle(
          textStyle: TextStyle(
            fontSize: 16,
            color: whiteColor.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
        ),
        dayFormat: 'EEE',
      ),
    );
  }
}

class _MonthCellDecoration extends Decoration {
  const _MonthCellDecoration({
    this.backgroundColor,
    required this.showIndicator,
    this.indicatorColor,
    this.borderColor,
  });

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _MonthCellDecorationPainter(
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        showIndicator: showIndicator,
        indicatorColor: indicatorColor);
  }
}

/// [_MonthCellDecorationPainter] used to paint month cell decoration.
class _MonthCellDecorationPainter extends BoxPainter {
  _MonthCellDecorationPainter(
      {this.borderColor,
      this.backgroundColor,
      required this.showIndicator,
      this.indicatorColor});

  final Color? borderColor;
  final Color? backgroundColor;
  final bool showIndicator;
  final Color? indicatorColor;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect bounds = offset & configuration.size!;
    _drawDecoration(canvas, bounds);
    // _drawText(canvas, 'E', bounds);
  }

  void _drawDecoration(Canvas canvas, Rect bounds) {
    final Paint paint = Paint()..color = backgroundColor!;
    canvas.drawRRect(
        RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    if (borderColor != null) {
      paint.color = borderColor!;
      canvas.drawRRect(
          RRect.fromRectAndRadius(bounds, const Radius.circular(5)), paint);
    }

    if (showIndicator) {
      paint.color = indicatorColor!;
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(Offset(bounds.right - 6, bounds.top + 6), 2.5, paint);
    }
  }
}
