// null許容演算子
void List2_9_1() {
  int? num; // nullで初期化される
  print(num); // null

  int nonnullNumber; // nullで初期化されない
  // nonnullNumber = null; // A value of type 'Null' can't be assigned to a variable of type 'int'.

  int? nullableNumber;
  nullableNumber = null; // OK
  print(nullableNumber); // null
}

// null認識演算子
void List2_9_2() {
  String? str;
  print(str?.length); // null

  String? str2;
  str2 = 'Hello';
  print(str2
      ?.length); // 5 // Warning: Operand of null-aware operation '?.' has type 'String' which excludes null.
}
