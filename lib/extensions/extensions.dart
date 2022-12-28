extension Range on num {
  bool isBetween(num from, num to) {
    return from - 1 < this && this < to;
  }
}
