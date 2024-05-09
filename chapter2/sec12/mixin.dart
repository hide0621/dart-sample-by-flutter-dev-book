/// mixinについて
///
/// Dartは多重継承（extends A, Bみたいなやつ）ができないが、mixinを使うことで多重継承のようなことができる
/// withキーワードに続けてミックスイン名を記述することで、そのクラスにミックスインを適用できる
/// その対象はmixinキーワードが付与されたミックスインだけ
///
/// mixinの特徴
///
/// 1. mixinはクラスを継承することができない（その代わりにonキーワードがある？）
/// 2. mixinはインスタンス化できない
/// 3. mixinはコンストラクタを定義できない
/// 4. ただし、クラスのようにフィールドやメソッドは持てる
///
/// またmixinは使用するクラスを制限することもできる
/// その際はonキーワードを使う
/// 下記の例で言えば、Animalクラスを継承しているクラスにしかHorse2とBird2は適用できない（Pegasus2はAnimalを継承することが強制される）

mixin Horse {
  void run() {
    print('run');
  }
}

mixin Bird {
  void fly() {
    print('fly');
  }
}

class Pegasus with Horse, Bird {}

void List2_12_21() {
  final pegasus = Pegasus();
  pegasus.run();
  pegasus.fly();
}

class Animal {
  String greet() => 'こんにちは';
}

// onキーワードを使って、mixinを適用するクラスを制限する
mixin Horse2 on Animal {
  void run() {
    greet(); // Animalクラスのメソッドを呼び出す
    print('run');
  }
}

// onキーワードを使って、mixinを適用するクラスを制限する
mixin Bird2 on Animal {
  void fly() {
    greet(); // Animalクラスのメソッドを呼び出す
    print('fly');
  }
}

// Animalクラスを継承しているクラスにしかHorse2とBird2は適用できない
class Pegasus2 extends Animal with Horse2, Bird2 {}

void List2_12_22() {
  final pegasus = Pegasus2();
  pegasus.greet();
  pegasus.run();
  pegasus.fly();
}
