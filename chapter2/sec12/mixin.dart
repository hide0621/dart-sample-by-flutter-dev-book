/// mixinについて
///
/// Dartは多重継承（extends A, Bみたいなやつ）ができないが、mixinを使うことで多重継承のようなことができる
/// withキーワードに続けてミックスイン名を記述することで、そのクラスにミックスインを適用できる
/// その対象はmixinキーワードが付与されたミックスインだけ
///
/// mixinの特徴
///
/// 1. mixinはクラスを継承することができない
/// 2. mixinはインスタンス化できない
/// 3. mixinはコンストラクタを定義できない
/// 4. ただし、クラスのようにフィールドやメソッドは持てる

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
