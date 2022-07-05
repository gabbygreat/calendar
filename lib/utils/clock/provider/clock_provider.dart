import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paint/utils/clock/controller/clock_controller.dart';

final clockProvider =
    StateNotifierProvider<ClockController, DateTime>((_) => ClockController());
