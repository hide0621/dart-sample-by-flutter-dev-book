void doSomething() {
  throw MyException('エラーが発生しました'); // 例外をスローする
}

void doSomething2() {
  print('doSomething2');
}

void doClean() {
  print('clean up');
}

// アサーションの検証用関数
int? nonNullableObject() {
  int? x = null;
  int? y = x;
  // int x = 10;
  // int? y = x;
  return y;
}

// MyExceptionがtoStringメソッドをオーバライドしていない場合
class MyException {
  MyException(this.message);
  final String message;
}

// MyExceptionがtoStringメソッドをオーバライドした場合
// class MyException {
//   MyException(this.message);
//   final String message;
//
//   @override
//   String toString() {
//     return 'MyException: $message';
//   }
// }

// 例外処理の基本形
// 実行結果（toStringをオーバーライドしてない時）: Instance of 'MyException'
// 実行結果（toStringをオーバーライドした時）: MyException: エラーが発生しました
void List2_7_1() {
  try {
    doSomething();
  } catch (e) {
    print(e);
  }
}

// 補足する例外オブジェクトを指定する時はonキーワードを使う
void List2_7_2() {
  try {
    doSomething();
  } on MyException {
    print('catch MyException'); // catch MyException
  }
}

// 例外オブジェクトを取得する場合はcatchブロックの引数に指定する
// catchの第一引数は例外オブジェクト、第二引数はスタックトレース
// スタックトレースには、エラーが発生したメソッドや行番号、それに至るまでのメソッド呼び出しの連鎖（呼び出し元のメソッド、その呼び出し元のメソッド、と遡る）が記録されています。
void List2_7_3() {
  try {
    doSomething();
  } catch (e, st) {
    print('catch $e'); // catch Instance of 'MyException'
    print(
        'stack trace: $st'); // stack trace: #0      doSomething (file:///Users/~/例外発生場所のパス)
  }
}

// 補足する型を指定しつつ例外オブジェクトを取得する場合は、onキーワードとcatchブロックの引数を組み合わせる
void List2_7_4() {
  try {
    doSomething();
  } on MyException catch (e) {
    print('catch : $e'); // catch : Instance of 'MyException'
  }
}

// 例外の再スロー
void List2_7_5() {
  try {
    doSomething();
  } on MyException catch (e) {
    print('catch : $e');
    rethrow; // 例外を再スローする
  }
}

// finallyブロック
void List2_7_6() {
  try {
    doSomething();
  } on MyException catch (e) {
    print('catch : $e'); // catch : Instance of 'MyException'
  } finally {
    doClean(); // clean up
  }
}

// finallyブロックを導入して例外がスローされない場合
void List2_7_7() {
  try {
    doSomething2(); // 例外がスローされない doSomething2を出力
  } on MyException catch (e) {
    print('catch : $e');
  } finally {
    doClean(); // clean up
  }
}

// 例外に一致するcatchブロックがない場合
// finallyが実行された後に、例外が呼び出し元に伝播される
void List2_7_8() {
  try {
    doSomething();
  } on FormatException catch (e) {
    // Unhandled exception: Instance of 'MyException'
    print('catch : $e');
  } finally {
    doClean(); // clean up
  }
}

// アサーションの例
void List2_7_9() {
  final valuable = nonNullableObject();

  assert(valuable !=
      null); // オブジェクトがnullでないことをチェック。アサーションに失敗した際はUnhandled exception:が出力される

  // assert(valuable != null,
  //     'valuables should not be null'); // アサーションが失敗した際は、このようにメッセージを付与することもできる
}

// 上記アサーションはDartでの場合だが、Flutterではアサーションはdebugビルドでのみ有効で、リリースビルドでは無効になる
// これを利用して、debugビルドでのみ実行されるコードを書くことができる
void List2_7_10() {
  assert(() {
    // debugビルドでのみ実行されるコード
    print('debug only code');
    return true;
    // 以下の()は無名関数の実行を表し、無名関数に引数を渡すこともできる！
  }());
}

// 無名関数に引数を渡す例
void List2_7_11() {
  assert((String message) {
    print('debug only code: $message');
    return true;
  }('Hello, world!'));
}

// 上記はこのように書き換え可能
void List2_7_12() {
  var message = 'Hello, world!';
  assert((String message) {
    print('debug only code: $message');
    return true;
  }(message));
}

// Flutterの例外処理
// Flutterアプリケーションでは、例外が発生すると、Flutterフレームワークが例外をキャッチして、エラー画面を表示する
// このエラー画面には、例外のスタックトレースや、エラーが発生した場所が表示される
// また、Flutterアプリケーションでは、エラー画面をカスタマイズすることもできる
// 例外が発生した場合にカスタムエラーページを表示するには、MaterialAppのbuilderプロパティを使用する

// void List2_7_13() {
//   runApp(
//     MaterialApp(
//       builder: (context, child) {
//         return ErrorWidget(
//           FlutterError('Custom error message'),
//         );
//       },
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello, world!'),
//         ),
//       ),
//     ),
//   );
// }

// 例外が発生した場合にカスタムエラーページを表示するには、MaterialAppのbuilderプロパティを使用する
// FlutterError.onErrorはFlutterで発生したエラーをハンドルするためのコールバック関数
// このコールバック関数にエラーが発生した際の処理を記述することで、エラー画面をカスタマイズできる

// なお、この例外処理はレンダリング処理やbuildメソッドといった、Flutterのウィジェットツリーの構築に関わる処理で発生したエラーをキャッチすることができる
// レンダリング処理とは、Flutterのウィジェットツリーが画面に描画されるための処理を指します。
// 具体的には、ウィジェットツリーの各ノード（ウィジェット）がどのように画面上に配置され、どのような見た目を持つべきかを計算する作業を指します。

// void List2_7_13() {
//   FlutterError.onError = (details) {
//     print('Caught error: $details');
//   };
//   runApp(const MyApp());
// }

// 上記以外で発生したエラー（ボタンのタップイベントハンドラなど）をキャッチするには、PlatformDispatcherでハンドリングする

// void List2_7_14() {
//   PlatformDispatcher.instance.onError = (error, stackTrace) {
//     print('Caught error: $error');
//     return true; // 例外を処理した際はtrueを返す
//   };
//   runApp(const MyApp());
// }
