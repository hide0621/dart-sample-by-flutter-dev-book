/// 拡張メソッド
///
extension SwapList<T> on List<T> {
  // 引数のインデックスの要素を入れ替える拡張メソッド
  void swap(int index1, int index2) {
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
