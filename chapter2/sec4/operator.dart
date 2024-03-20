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
