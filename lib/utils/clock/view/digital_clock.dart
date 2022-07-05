import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:paint/utils/clock/provider/clock_provider.dart';
import 'package:paint/utils/constants/color.dart';
import 'package:paint/utils/functions/functions.dart';

class DigitalClockView extends ConsumerStatefulWidget {
  const DigitalClockView({Key? key}) : super(key: key);

  @override
  ConsumerState<DigitalClockView> createState() => _DigitalClockViewState();
}

class _DigitalClockViewState extends ConsumerState<DigitalClockView> {
  @override
  void initState() {
    super.initState();
    ref.read(clockProvider.notifier).updateTime();
  }

  @override
  Widget build(BuildContext context) {
    final clock = ref.watch(clockProvider);
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat('hh:mm').format(clock),
            style: TextStyle(
              color: whiteColor,
              fontSize: 100,
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
