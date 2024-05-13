library chapter2.sec12.base.base_use;

import 'class-modifier-base.dart';

/// クラスの継承はOK。Dogクラスにもbase修飾子は必要だが...
base class Dog extends Animal {}

/// クラスの実装はNG。　コンパイルエラー
/// The class 'Animal' can't be implemented outside of its library because it's a base class.
// base class Cat implements Animal {
//   @override
//   String greet() => 'Meow';
// }

void List2_12_27() {
  final animal = Animal();
  final dog = Dog();
  print(animal.greet()); // Prints: Hello
  print(dog.greet()); // Prints: Hello（オーバーライドしてないので）
}
