/// ライブラリについて
///
/// ライブラリは関連するコードを一緒にグループ化する方法であり、関数、クラス、変数、およびその他の機能を含むことができる
/// ライブラリは、コードの再利用、パッケージ化、および共有を容易にする（Go言語のパッケージみたいなもの？）

/// ライブラリは import と library ディレクティブを使用して他のライブラリからアクセスできるようにしている
/// import ディレクティブを使用してライブラリをインポートし、そのライブラリの機能を使用できる
/// library ディレクティブはオプションで、ライブラリの名前を指定する
///
/// ライブラリはまた、プライバシーを提供する
/// アンダースコア (_) で始まる識別子は、そのライブラリ内でのみアクセス可能であり、他のライブラリからはアクセスできない

// ファイル: my_library.dart
library my_library;

int _privateVariable = 10;

int publicVariable = 20;

void _privateFunction() {
  print('This is a private function');
}

void publicFunction() {
  print('This is a public function');
}
