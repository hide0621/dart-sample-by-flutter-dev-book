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

  // 名前付きフィールドの記述順序は等値性に影響を与えない
  final record5 = (name: 'apple', price: 100);
  print(record4 == record5); // true

  // 型注釈の中で位置フィールドに名前を付与できる
  // この場合、フィールド同士で等値性に影響を与えない（ただし、名前付きフィールド＝位置フィールドとはならないので注意）
  final (int price, String name) record6 = (100, 'apple');
  final (int x, String y) record7 = (100, 'apple');
  print(record6 == record7); // true

  // 名前付きフィールドと位置フィールドを混在させることもできる
  final record8 = (price: 300, name: 'cake', 99);
  print(record8); // (99, name: cake, price: 300)
  // 位置フィールドに型注釈をする際は、その記述を先頭に書く
  final (int count, {String name, int price}) record9 =
      record8; // 名前付きフィールドは記述順序の違いによって等値性に影響を与えない
  print(record9); // (99, name: cake, price: 300)
  print(record9 == record8); // true

  // 名前付きフィールドのゲッターはこう
  print(record9.name); // cake

  // 位置フィールドのゲッターはこう
  print(record1.$1); // 300
  print(record6.$1); // 100

  // 位置フィールドと名前付きフィールドを混在させたrecordの中から、位置フィールドの値を取り出すこともできる
  print(record8.$1); // 99
  print(record9.$1); // 99
}
