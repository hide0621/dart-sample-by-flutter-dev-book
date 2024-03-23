// if-case文
void List2_5_1() {
  final (String?, int?) response = ('OK', 200);
  // final (String?, int?) response = (null, 200);

  // Recordのフィールドの型が一致していて、かつ、nullか否かを判定
  if (response case (String message, int code)) {
    print('Response: $message, code: $code');
  } else {
    print('No response received');
  }
}

// if-case-when文
void List2_5_2() {
  // final (String?, int?) response = ('OK', 200);
  final (String?, int?) response = ('Not Found', 404);
  // final (String?, int?) response = (null, 200);

  // Recordのフィールドの型が一致していて、かつ、nullか否かとcodeが200か否かを判定
  if (response case (String message, int code) when code == 200) {
    print('Response: $message, code: $code');
  } else {
    print('No response received');
  }
}

void doSomethingIfRed() {
  print('赤色です');
}

void doSomethingIfBlue() {
  print('青色です');
}

void doSomethingIfGreenOrYellow() {
  print('緑色または黄色です');
}

// switch文（break, fall-through, throw）
void List2_5_3() {
  final color = 'white';

  switch (color) {
    case 'red':
      doSomethingIfRed();
    case 'blue':
      doSomethingIfBlue();
    case 'black':
      break; // switch文を抜ける
    case 'green': // fall-throughという現象
    case 'yellow':
      print('緑色または黄色です'); // greenとyellowの場合は同じ処理を行う
    default:
      throw 'Unexpected color: $color'; // Unhandled exception: Unexpected color: white
  }
}

// 早期リターンに書き換え
void List2_5_4() {
  final color = 'red';

  switch (color) {
    case 'red':
      return doSomethingIfRed();
    case 'blue':
      return doSomethingIfBlue();
    case 'black':
      break; // switch文を抜ける
    case 'green': // fall-throughという現象
    case 'yellow':
      return print('緑色または黄色です'); // greenとyellowの場合は同じ処理を行う
    default:
      throw 'Unexpected color: $color'; // Unhandled exception: Unexpected color: white
  }
}

// switch文（continueとlabelを使ってfall-through）
void List2_5_5() {
  final color = 'red';
  // final color = 'black';

  switch (color) {
    case 'red':
      doSomethingIfRed(); // エラー文の後に「赤色です」が標準出力される
      continue other; // otherラベルにジャンプ
    case 'blue':
      doSomethingIfBlue();
    other: // otherラベル
    case 'black':
      throw 'Unexpected color: $color'; // Unhandled exception: Unexpected color: red
  }
}
