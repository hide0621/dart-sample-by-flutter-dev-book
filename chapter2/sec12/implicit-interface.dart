/// Dartでは全てのクラスは暗黙的にインターフェースが定義されている
/// implementsキーワードに続けて、インターフェースとして実装する型名を記述することで、そのクラスがそのインターフェースを実装していることを示す
class Animal {
  String greet() => 'Hello';
  // void eat() {
  //   print('Animal eats');
  // }
}

/// 上記インターフェースのeatメソッドがコメントアウト化されていなかったら、このメソッドもオーバーライドしないといけない
/// そうしないと、「Missing concrete implementation of 'Animal.eat'.」というエラーが出る
/// そのため、インターフェースのメソッドが多い場合は、インターフェースを使うことで、オーバーライドの漏れを防げる（実装の強制）
class Dog implements Animal {
  @override
  String greet() => 'Bow-Bow';
}

void List2_12_16() {
  final dog = Dog();
  print(dog.greet()); // Bow-Bow
}
