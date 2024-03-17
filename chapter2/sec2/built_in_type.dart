void List2_2_1() {
  var name = 'dart';

  var str1 = 'こんにちは、$nameさん';

  print(str1);

  var str2 = 'こんにちは、${name.toUpperCase()}さん';

  print(str2);
}

void List2_2_2() {
  // リスト（スライスのようなもの）を定義 → 可変長
  final baseList = [0, 1, 2, 3];

  print(baseList);

  baseList.add(4);

  print(baseList);

  baseList.remove(4);

  print(baseList);

  // 固定長のリストを新しく定義する
  final fixedLenghtList = List.unmodifiable(baseList);

  print(fixedLenghtList);

  // 以下のコードはエラーになる
  // fixedLenghtList.add(5); // Unhandled exception: Unsupported operation: Cannot add to an unmodifiable list
}
