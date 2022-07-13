String getDayInIgbo({DateTime? date, bool reduce = false}) {
  int test1 = date!.millisecondsSinceEpoch;
  int day = Duration(milliseconds: test1).inDays.remainder(4);

  final Map<int, String> igboDays = {
    0: reduce ? 'Eke' : 'Nkwo',
    1: reduce ? 'Oye' : 'Eke',
    2: reduce ? 'Afor' : 'Oye',
    3: reduce ? 'Nkwo' : 'Afor',
  };

  return igboDays[day] ?? '';
}
