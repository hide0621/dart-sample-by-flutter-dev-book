/// 拡張メソッド
///
/// 拡張メソッドはメソッドのラップ、カスタムと同じものと思われる
///
/// extension <拡張名> on <拡張対象の型>
/// <拡張対象の型>とは紐づくオブジェクト自身、型自身を指しているものと思われ、Go言語に似ている
/// <拡張名>は識別子のようなものと思われる
extension SwapList<T> on List<T> {
  // 引数のインデックスの要素を入れ替える拡張メソッド
  void swap(int index1, int index2) {
    // thisキーワードは拡張対象の型を指す（紐づくオブジェクト自身）
    final tmp = this[index1];
    this[index1] = this[index2];
    this[index2] = tmp;
  }
}

void List2_12_17() {
  final list = [1, 2, 3];
  list.swap(0, 2);
  print(list); // [3, 2, 1]
}
