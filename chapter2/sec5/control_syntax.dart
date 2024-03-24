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

// switch-when文
void List2_5_6() {
  final int? statusCode = null;

  // 以下のcase式の中ではstatusCodeがnullか否かも判定している
  switch (statusCode) {
    case (int statusCode) when 100 <= statusCode && statusCode < 200:
      print('Informational');
    case (int statusCode) when 200 <= statusCode && statusCode < 300:
      print('Successful');
    case (int statusCode) when 300 <= statusCode && statusCode < 400:
      print('Redirection');
    case (int statusCode) when 400 <= statusCode && statusCode < 500:
      print('Client Error');
    case (int statusCode) when 500 <= statusCode && statusCode < 600:
      print('Server Error');
    case (null):
      print('No response received');
    default:
      throw 'Unexpected status code: $statusCode';
  }
}

// switchを式として扱う
void List2_5_7() {
  final statusCode = 404;

  final message = switch (statusCode) {
    >= 100 && < 200 => 'Informational',
    >= 200 && < 300 => 'Successful',
    >= 300 && < 400 => 'Redirection',
    >= 400 && < 500 => 'Client Error',
    >= 500 && < 600 => 'Server Error',
    _ => 'Unknown status code: $statusCode',
  };
  print(message);
}

// for文
// 以下のループでは、iの値が増加するタイミングの違いは無視される
// なぜなら、i++と++iの結果は、print(i);の評価が終わった後であり、その結果はどこにも使用されないからです
// より正確にいうと、iの値を参照して標準出力するタイミングでは、前置の場合も後置の場合も、どちらのiもすでにインクリメントされています
void List2_5_8() {
  for (var i = 0; i < 5; i++) {
    print(i);
  }
  print('---');
  for (var i = 0; i < 5; ++i) {
    print(i);
  }
}

// Iterableの要素を反復処理する
// Iterableは、リスト、セットのスーパークラス
// for-in文
void List2_5_9() {
  final colors = ['red', 'green', 'blue'];

  for (final color in colors) {
    print(color);
  }
}
