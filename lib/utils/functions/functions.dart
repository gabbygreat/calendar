String getDayInIgbo({DateTime? date, bool useDate = true, int theDay = 1}) {
  int weekday = 1;
  if (useDate) {
    weekday = date!.weekday - 1;
  } else {
    weekday = theDay;
  }

  final Map<int, String> igboDays = {
    0: 'Eke',
    1: 'Oye',
    2: 'Afor',
    3: 'Nkwo',
  };
  final day = weekday.remainder(4);
  return igboDays[day] ?? '';
}
