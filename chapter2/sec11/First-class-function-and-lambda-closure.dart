/// 第１級関数と匿名関数

void List2_11_7() {
  // 引数を２倍にして返す関数
  int doubleValue(int value) {
    return value * 2;
  }

  // 関数doubleValueを変数fに代入
  final int Function(int) f = doubleValue;

  final result = f(10);

  print(result); // 20
}
