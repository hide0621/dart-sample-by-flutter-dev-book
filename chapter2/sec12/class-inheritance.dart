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

/// 引数の型が同じ、またはそのスーパークラスになっているパターン
class Animal4 {
  void eat(Meat food) {
    print('Animal eats $food');
  }
}

class Dog4 extends Animal4 {
  /// 引数をスーパークラス化（抽象化、階層をあげてあげる）させることで、スーパークラスのメソッドの引数も受け取れる
  /// ある種、ダックタイピングに近いことをさせてあげられるようにしている
  /// → Go言語のインターフェースとその実装・呼び出しのような感じ
  /// → Dartでは全てのクラスは暗黙的にインターフェースが定義されていることと関係がある？
  @override
  void eat(Food food) {
    print('Dog eats $food');
  }
}

class Food {}

class Meat extends Food {}

void List2_12_13() {
  final dog = Dog4();

  /// 引数をスーパークラス化（抽象化、階層をあげてあげる）させることで、スーパークラスのメソッドの引数も受け取れる（ある種、ダックタイピングに近い）
  dog.eat(Meat());
  dog.eat(Food());
}

/// 戻り値がnull許容型のメソッドを非null許容型のメソッドにオーバーライドするパターン
class Animal5 {
  String? eat() {
    return null;
  }
}

class Dog5 extends Animal5 {
  @override
  String eat() {
    return 'Dog eats';
  }
}

void List2_12_14() {
  final dog = Dog5();
  print(dog.eat()); // Dog eats
}

/// superキーワードを使ってスーパークラスのコンストラクタを呼び出すパターン
class Animal6 {
  Animal6(this.name);
  final String name;
}

/// パターン1
class Dog6 extends Animal6 {
  /// サブクラスのコンストラクタ引数をスーパークラスのコンストラクタに渡すパターン
  Dog6(String name) : super(name);
}

/// パターン2
class Dog66 extends Animal6 {
  /// サブクラスのコンストラクタの中でスーパークラスのフィールドを参照し、それをサブクラスのコンストラク引数にするパターン
  Dog66(super.name);
}

void List2_12_15() {
  final dog = Dog6('Pochi');
  print(dog.name); // Pochi

  final dog2 = Dog66('Taro');
  print(dog2.name); // Taro
}
