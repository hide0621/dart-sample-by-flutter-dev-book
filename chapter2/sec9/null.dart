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
