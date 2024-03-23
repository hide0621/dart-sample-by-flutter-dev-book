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
