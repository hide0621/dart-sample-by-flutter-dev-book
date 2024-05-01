/// 最もシンプルなクラス継承のパターン
class Animal {
  String greet() => 'Hello';
}

class Dog extends Animal {}

void List2_12_10() {
  final dog = Dog();
  print(dog.greet()); // Hello
}

/// superキーワードを使ってスーパークラスを参照するパターン
class Animal2 {
  String greet() => 'Hello';
}

class Dog2 extends Animal2 {
  String sayHello() => super.greet();
}

void List2_12_11() {
  final dog = Dog2();
  print(dog.sayHello()); // Hello
}

/// @overrideアノテーションを使ってオーバーライドを明示するパターン
class Animal3 {
  String greet() => 'Hello';
}

class Dog3 extends Animal3 {
  @override
  String greet() => 'Bow-Bow';
}

void List2_12_12() {
  final dog = Dog3();
  print(dog.greet()); // Bow-Bow
}

/// メソッドのオーバーライドの条件
///
/// 条件１：スーパークラスとサブクラスのメソッドのシグネチャが一致していること
/// ↓
/// 戻り値の型が同じ、またはそのサブタイプになっている
/// 引数の型が同じ、またはそのスーパークラスになっている
/// 引数の数が同じ
///
/// 条件２：ジェネリックメソッドを非ジェネリックメソッドでオーバーライドできない、逆も同様