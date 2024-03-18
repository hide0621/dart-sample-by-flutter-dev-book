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
  final fixedLengthList = List.unmodifiable(baseList);

  print(fixedLengthList);

  // 以下のコードはエラーになる
  // fixedLengthList.add(5); // Unhandled exception: Unsupported operation: Cannot add to an unmodifiable list
}

void List2_2_3() {
  // Recordを定義
  // Recordはタプル型に似ており、異なる型の要素（フィールド）を持つことができる不変の匿名型である
  // このあと実装する名前付きフィールドに対して、以下のようなフィールドを位置フィールドと呼ぶ
  final record1 = (300, 'cake');
  print(record1);

  // Recordの型注釈は以下のようにする
  final (int, String) record2 = record1;
  print(record2);

  // フィールドに名前をつけることもできる(名前付きフィールド)
  final record3 = (price: 100, name: 'apple');
  final ({int price, String name}) record4 = record3;
  print(record4);

  // 名前付きフィールドの記述は等値性に影響を与えない
  final record5 = (name: 'apple', price: 100);
  print(record4 == record5); // true
}
