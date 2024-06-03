/// base修飾子
///
/// 特徴（自身が宣言されたライブラリ以外での場合）
///
/// インスタンス化　O
/// extendsキーワードによる継承 O
/// implementsキーワードによる実装 X

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
///
/// どうやら、違うらしい...（以下はgithub copilotの回答）
///
/// はい、Dartでは一つのDartファイルを一つのライブラリとみなします。
/// ライブラリは関連するAPIを一つにまとめるための単位で、それぞれのDartファイルはそれ自体がライブラリとなります。
/// 一方で、libraryキーワードはライブラリの名前を明示的に指定するために使用されます。
/// libraryキーワードを使用すると、ライブラリ全体を通じて一貫した名前空間を提供することができます。
/// これは特にパッケージが大規模になったときや、複数のパッケージが互いに密接に連携する必要があるときに有用です。
/// しかし、Dart 2ではlibraryキーワードはオプションで、ほとんどの場合は必要ありません。
/// Dartのライブラリは、それぞれが独自の名前空間を持つため、名前の衝突を避けるためにlibraryキーワードを使用する必要はありません。
/// その代わり、importとexportを使用してライブラリ間でコードを共有します。
/// したがって、libraryキーワードと一つのDartファイルがライブラリであるという概念は、どちらもライブラリを定義するためのものですが、その使用方法と目的が異なります。

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
