import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:igbocalendar/utils/clock/provider/clock_provider.dart';
import 'package:igbocalendar/utils/constants/color.dart';
import 'package:igbocalendar/utils/functions/functions.dart';

class DigitalClockView extends ConsumerStatefulWidget {
  const DigitalClockView({Key? key}) : super(key: key);

  @override
  ConsumerState<DigitalClockView> createState() => _DigitalClockViewState();
}

class _DigitalClockViewState extends ConsumerState<DigitalClockView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(clockProvider.notifier).updateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    final clock = ref.watch(clockProvider);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(
            child: Text(
              DateFormat('hh:mm').format(clock),
              style: TextStyle(
                color: whiteColor,
                fontSize: 100,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Text(
            getDayInIgbo(date: clock),
            style: TextStyle(
              color: whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            DateFormat('EEEE, dd MMMM yyyy').format(clock),
            style: TextStyle(
              color: whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
