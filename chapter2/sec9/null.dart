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

// ??演算子（null合体演算子）
// 左辺の値がnullである場合に右辺の値を返す
// 左辺の値がnullでない場合は、左辺の値自体が返される
void List2_9_5() {
  String? str;
  print(str ?? 'nullです'); // nullです

  String? str2;
  str2 = 'Hello';
  print(str2 ?? 'nullです'); // Hello
}

// ??=演算子（null許容代入演算子）
// 左辺の値がnullである場合に右辺の値を代入する
// 左辺の値がnullでない場合は、左辺の値自体が変更されない
void List2_9_6() {
  String? str;
  print(str); // null
  str ??= 'Hello'; // strがnullなので'Hello'が代入される
  print(str); // Hello

  String? str2;
  str2 = 'World';
  print(str2); // World
  str2 ??= 'Hello'; // str2がnullでないので何も変更されない
  print(str2); // World
}
