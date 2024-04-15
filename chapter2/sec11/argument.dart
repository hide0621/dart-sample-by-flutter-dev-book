// 省略可能引数
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
