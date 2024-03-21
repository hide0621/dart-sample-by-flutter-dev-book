// 前置の場合（インクリメント）
void List2_4_1() {
  int a;
  int b;

  a = 0;
  // aをインクリメントした後にbに代入
  b = ++a;

  print('a: $a, b: $b'); // a: 1, b: 1
}

// 後置の場合（インクリメント）
void List2_4_2() {
  int a;
  int b;

  a = 0;
  // aをbに代入した後にaをインクリメント
  b = a++;

  print('a: $a, b: $b'); // a: 1, b: 0
}

// 前置の場合（デクリメント）
void List2_4_3() {
  int a;
  int b;

  a = 0;
  // aをデクリメントした後にbに代入
  b = --a;

  print('a: $a, b: $b'); // a: -1, b: -1
}

// 後置の場合（デクリメント）
void List2_4_4() {
  int a;
  int b;

  a = 0;
  // aをbに代入した後にaをデクリメント
  b = a--;

  print('a: $a, b: $b'); // a: -1, b: 0
}

// 三項演算子
void List2_4_5() {
  int a = 10;
  int b = 20;

  // aがbより大きい場合はaを、それ以外の場合はbを代入
  int c = a > b ? a : b;

  print('c: $c'); // c: 20
}

// カスケード記法
void List2_4_6() {
  // カスケード記法を使わない場合
  var sb = StringBuffer(); // sb = {StringBuffer}
  sb.write('Dart'); // sb = {StringBuffer: Dart}
  sb.write('Flutter'); // sb = {StringBuffer: DartFlutter}
  sb.write('Firebase'); // sb = {StringBuffer: DartFlutterFirebase}
  print(sb.toString()); // DartFlutterFirebase

  // カスケード記法を使う場合
  var sb2 = StringBuffer()
    ..write('Dart')
    ..write('Flutter') // 下の処理が実行されるまではsb2というオブジェクトは生成されず、値も持っていない
    ..write('Firebase'); // sb2 = {StringBuffer: DartFlutterFirebase}
  print(sb2.toString()); // DartFlutterFirebase
}

// スプレッド演算子
void List2_4_7() {
  var list1 = [1, 2, 3];
  var list2 = [4, 5, 6];

  // スプレッド演算子を使わない場合
  var list3 = List<int>.empty(growable: true);
  list3.addAll(list1);
  list3.addAll(list2);
  print(list3); // [1, 2, 3, 4, 5, 6]

  // スプレッド演算子を使う場合
  var list4 = [...list1, ...list2];
  print(list4); // [1, 2, 3, 4, 5, 6]
}

// 制御構文演算子
void List2_4_8() {
  var flag = true;

  // flagがtrueの場合は3を追加
  final List1 = [0, 1, 2, if (flag) 3, 4];

  print(List1); // [0, 1, 2, 3, 4]

  flag = false;

  // flagがfalseの場合は3を追加しない
  final List2 = [0, 1, 2, if (flag) 3, 4];

  print(List2); // [0, 1, 2, 4]

  final List3 = [1, 2, 3];

  // List3の要素を2倍にして追加
  final List4 = [0, for (var i in List3) i * 2];

  print(List4); // [0, 2, 4, 6]
}
