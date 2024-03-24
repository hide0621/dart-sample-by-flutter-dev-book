// マッチングしか持たないパターン
// 例：switch, 式としてのswitch（以下のList2_6_3()のようなもの）, if-case
// マッチングしか持たないパターンは変数の宣言には使えない（例：List2_6_4）

void List2_6_3() {
  final statusCode = 404;
  final response = switch (statusCode) {
    >= 100 && < 200 => 'Informational',
    >= 200 && < 300 => 'Success',
    >= 300 && < 400 => 'Redirection',
    >= 400 && < 500 => 'Client Error',
    >= 500 && < 600 => 'Server Error',
    _ => 'Unknown Status Code',
  };
  print(response); // Client Error
}

// マッチングしか持たないパターンは変数の宣言には使えない例
void List2_6_4() {
  final statusCode = 404;
  switch (statusCode) {
    case 404:
      final response = 'Not Found'; // これはエラーになります
      break;
    default:
      final response = 'Unknown Status Code'; // これもエラーになります
  }
  // print(response); // responseはスコープ外なのでエラーになります
}

// 一致判定（変数、定数）
// リテラル（caseの後に続く部分のこと）には数値、bool、文字列リテラルが使用可能
void List2_6_5() {
  final variable = 123;
  switch (variable) {
    case 123:
      print('123');
    case 'str':
      print('str');
    case false:
      print('false');
  }
}

// 一致判定（コレクション型）
// コレクション型の一致判定の際は、リテラルにconstを付ける必要がある
void List2_6_6() {
  final variable = {'key': 0}; // defaultが出力される（判定のタイミングが実行時なので）
  // const variable = {'key': 0}; // Mapが出力される（判定のタイミングがコンパイル時なので）
  switch (variable) {
    case const [0, 1, 2]:
      print('List');
    case const {0, 1, 2}:
      print('Set');
    case const {'key': 0}:
      print('Map');
    default:
      print('default');
  }
}

class SomeClass {
  const SomeClass();
}

// 一致判定（constやstaticを付与した定数）
void List2_6_7() {
  final variable = 123;
  switch (variable) {
    case double.maxFinite:
      print('maxFinite');
    case const SomeClass():
      print('SomeClass');
    default:
      print('default');
  }
}
