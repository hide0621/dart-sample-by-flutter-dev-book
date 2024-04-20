/// 全てのインスタンス変数は暗黙的にゲッターをもち、final修飾子のないそれは暗黙的にセッターをもつ

class User {
  User(this.id, this._password);

  final int id;
  String _password;
}

void List2_12_4() {
  final user = User(1, 'password');
  print(user.id);
  print(user._password);
  // user.id = 2; // Error: The setter 'id' isn't defined for the class 'User'.
  user._password = 'new password';
  print(user._password);
}

/// プロパティのカスタムゲッター、カスタムセッターの例
///
/// Dartではメソッドとプロパティ（ゲッターとセッター）は異なる概念
///
/// セッターは特殊な種類のメソッドであり、その名前の後に値を設定するための等号（=）を使用する
///
/// user2.password('new password')という書き方は、passwordがメソッドとして定義されている場合にのみ有効
///
/// 以下のようにセッターとして使うなら、user2.password = 'new password'と書く

class User2 {
  User2(this.id, this._password);

  final int id;
  String _password;

  /// 外部からはこのゲッターを開始て呼び出す
  // カスタムゲッター（getキーワード）
  // パスワードを伏せ字にして返す
  String get password => '****';

  /// 外部からはこのセッターを使って値を設定する
  // カスタムセッター（setキーワード）
  // パスワードをハッシュ化してセットする
  set password(String value) {
    _password = value.hashCode.toString();
  }
}

void List2_12_5() {
  final user2 = User2(1, 'password');
  print(user2.password);

  user2.password = 'new password';
  print(user2.password);
  print(user2._password);
}
