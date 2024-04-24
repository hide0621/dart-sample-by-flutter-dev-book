/// factoryコンストラクタ
///

class UserData {
  static final Map<int, UserData> _cache = {};

  // factoryコンストラクタを定義
  factory UserData.fromCache(int userId) {
    // キャッシュを探す
    final cache = _cache[userId];
    if (cache != null) {
      // キャッシュがあったので返す
      return cache;
    }

    // キャッシュがなかったので新しいインスタンスを生成して返す
    final newInstance = UserData();

    _cache[userId] = newInstance;
    return newInstance;
  }

  // 通常のコンストラクタを定義
  UserData();
}

void List2_12_9() {
  // キャッシュを使うパターン
  final user1 = UserData.fromCache(1);
  final user2 = UserData.fromCache(2);
  final user3 = UserData.fromCache(1);

  print(user1 == user2); // false
  print(user1 == user3); // true

  // キャッシュを使わないパターン
  final user4 = UserData();
  print(user1 == user4); // false
}
