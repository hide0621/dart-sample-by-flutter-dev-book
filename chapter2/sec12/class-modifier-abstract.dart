/// クラス修飾子
///
/// abstract修飾子
///
/// 特徴
///
/// インスタンス化　X
/// extendsキーワードによる継承 O
/// implementsキーワードによる実装 O

abstract class Animal {
  String greet(); // 本体のないabstract関数
}

class Dog extends Animal {
  @override
  String greet() => 'bowbow';
}

void List2_12_26() {
  // オブジェクト化はできない
  // final animal = Animal(); // Error: The class 'Animal' is abstract and can't be instantiated.

  Animal dog = Dog(); // Animal型で宣言
  // final dog = Dog(); // Dog型で宣言
  print(dog.greet()); // Prints: bowbow
}
