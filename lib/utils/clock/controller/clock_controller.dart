import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockController extends StateNotifier<DateTime> {
  ClockController() : super(DateTime.now());

  updateTime() => state = DateTime.now();
}
