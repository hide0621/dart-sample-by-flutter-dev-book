/// 第１級関数と匿名関数
///
/// 関数オブジェクトの型は、「戻り値の型 Function(引数の型)」という形式で表現される。

void List2_11_7() {
  // 引数を２倍にして返す関数
  int doubleValue(int value) {
    return value * 2;
  }

  // 関数doubleValueを変数fに代入 → 変数fはint型の引数を受け取り、int型の戻り値を返す関数オブジェクトとなる
  final int Function(int) f = doubleValue;

  final result = f(10);

  print(result); // 20
}
