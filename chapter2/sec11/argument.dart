// 省略可能引数

// なお、省略可能引数は引数リストの末尾に置く必要がある

void List2_11_1() {
  void makeColor(int red, int green, int blue, [int? alpha]) {
    print('red: $red, green: $green, blue: $blue, alpha: $alpha');
  }

  makeColor(0xFF, 0x00,
      0x33); // 引数alphaを省略して呼び出し red: 255, green: 0, blue: 51, alpha: null

  makeColor(0xFF, 0x00, 0x33,
      0xFF); // 引数alphaを与えて呼び出し red: 255, green: 0, blue: 51, alpha: 255
}

// 省略可能引数にデフォルト値を与える
void List2_11_2() {
  void makeColor(int red, int green, int blue, [int alpha = 0xFF]) {
    print('red: $red, green: $green, blue: $blue, alpha: $alpha');
  }

  makeColor(0xFF, 0x00,
      0x33); // 引数alphaを省略して呼び出し red: 255, green: 0, blue: 51, alpha: 255

  makeColor(0xFF, 0x00, 0x33,
      0x88); // 引数alphaを与えて呼び出し red: 255, green: 0, blue: 51, alpha: 136
}

// 名前付き引数
void List2_11_3() {
  void makeColor({int? red, int? green, int? blue}) {
    print('red: $red, green: $green, blue: $blue');
  }

  // 呼び出し時に引数の名前を指定する
  makeColor(red: 0xFF, green: 0x00, blue: 0x33); // red: 255, green: 0, blue: 51
}

// 名前付き引数はデフォルトでは省略可能として扱われる
// 必須にする場合はrequiredキーワードを付ける
// また、デフォルト値を与えることもできる
void List2_11_4() {
  void makeColor(
      {int? red, required int green, required int blue, int alpha = 0xFF}) {
    print('red: $red, green: $green, blue: $blue, alpha: $alpha');
  }

  makeColor(
      green: 0x30, blue: 0xBF); // red: null, green: 48, blue: 191, alpha: 255

  // 引数の順番を変えて呼び出すこともできる
  makeColor(
      blue: 0xBF, green: 0x30); // red: null, green: 48, blue: 191, alpha: 255
}

// なお、名前付き引数は引数リストの末尾に置く必要があるが、
// 呼び出し時は位置引数を後方においても問題ない
List2_11_5() {
  void makeColor(String colorName,
      {required int red, required int green, required int blue}) {
    print('$colorName: red: $red, green: $green, blue: $blue');
  }

  // 呼び出し時は名前付き引数が銭湯でも可
  makeColor(
      red: 0x78,
      green: 0x30,
      blue: 0xBF,
      'purple'); // purple: red: 120, green: 48, blue: 191
}
