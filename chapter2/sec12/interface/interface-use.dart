import 'class-modifier-interface.dart';

/// クラスの継承はNG
// class Dog extends Animal {}

// クラスの実装はOK
class Cat implements Animal {
  @override
  String greet() => 'meow';
}

void List2_12_29() {
  /// インスタンス化はOK
  final animal = Animal();

  // final dog = Dog();
  final cat = Cat();
  print(cat.greet()); // meow

  final cat2 = Animal();
  print(cat2.greet()); // hello
}
