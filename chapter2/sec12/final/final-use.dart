import 'class-modifier-final.dart';

/// クラスの継承はNG
// base class Dog extends Animal {}

/// クラスの実装もNG
// base class Cat implements Animal {
//   @override
//   String greet() => 'meow';
// }

void List2_12_31() {
  /// インスタンス化はOK
  final animal = Animal();
  print(animal.greet());
}
