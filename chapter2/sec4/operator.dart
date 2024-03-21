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
  var sb = StringBuffer();
  sb.write('Dart');
  sb.write('Flutter');
  sb.write('Firebase');
  print(sb.toString()); // DartFlutterFirebase

  // カスケード記法を使う場合
  var sb2 = StringBuffer()
    ..write('Dart')
    ..write('Flutter')
    ..write('Firebase');
  print(sb2.toString()); // DartFlutterFirebase
}
