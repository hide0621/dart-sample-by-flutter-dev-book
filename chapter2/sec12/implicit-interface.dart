/// Dartでは全てのクラスは暗黙的にインターフェースが定義されている
/// implementsキーワードに続けて、インターフェースとして実装する型名を記述することで、そのクラスがそのインターフェースを実装していることを示す
class Animal {
  // Animal(this.name);
  // final String name;
  String greet() => 'Hello';
  // void eat() {
  //   print('Animal eats');
  // }
}

/// 上記インターフェースのeatメソッドがコメントアウト化されていなかったら、このメソッドもオーバーライドしないといけない
/// そうしないと、「Missing concrete implementation of 'Animal.eat'.」というエラーが出る
/// これはnameフィールドの場合も同様で、オーバーライドをしないと「Missing concrete implementation of 'getter Animal.name'」というエラーが出る
/// そのため、インターフェースのメソッドが多い場合は、インターフェースを使うことで、オーバーライドの漏れを防げる（実装の強制）
/// 全てのインスタンスメンバ、メソッドをオーバーライドしないといけない点が、extendsキーワードとimplementsキーワードの違い
class Dog implements Animal {
  // @override
  // Dog(this.name);
  // final String name;

  @override
  String greet() => 'Bow-Bow';

  // @override
  // void eat() {
  //   print('Dog eats');
  // }
}

void List2_12_16() {
  final dog = Dog();
  print(dog.greet()); // Bow-Bow
}
