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

// nullアサーション演算子
void List2_9_3() {
  String? str;
  // print(str!
  //     .length); // Unhandled exception: Null check operator used on a null value

  String? str2;
  str2 = 'Hello';
  print(str2!
      .length); // 5 // Warning: Operand of null-aware operation '!' has type 'String' which excludes null.
}

// タイププロモーション
// タイププロモーションとは、Dartの機能の一つで、特定の条件下で変数の型を自動的に「昇格」させること
// 例えば、null許容型の変数がnullでないことが確定した場合、その変数をnull許容型から非null許容型に変換することができる
void List2_9_4() {
  String? str;
  str = 'Hello';
  if (str == null) {
    return;
  }
  // 上記のif文を通過した時点で、Dartのコンパイラはstrがnullでないことを知っているため、
  // その後のコードではstrをnullでないString型として扱う（タイププロモーション）
  print(str.length);
}
