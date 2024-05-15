/// base修飾子
///
///

library chapter2.sec12.base.class_modifier_base;

base class Animal {
  String greet() => 'Hello';
}

base class Animal2 {
  void _sleep() {
    print('sleep');
  }

  String greet() {
    return 'Hello';
  }
}

/// 同じファイル内で定義した場合（同一ライブラリ内）はエラーにならない...
///
/// dartでは、ライブラリとはある一つのdartファイルのことを指すので理解もできるが、libraryキーワードとの概念の違いがあるのか...？

/// 同一ライブラリ内であればクラスの実装OK
base class Cat implements Animal2 {
  /// 同一ライブラリ内なのでプライベートメソッドも
  /// オーバーライドが強制される
  @override
  void _sleep() {
    print('zzz');
  }

  @override
  String greet() {
    return 'Meow';
  }
}

void List2_12_28() {
  final cat = Cat();
  print(cat.greet()); // Prints: Meow
  cat._sleep(); // Prints: zzz
}
