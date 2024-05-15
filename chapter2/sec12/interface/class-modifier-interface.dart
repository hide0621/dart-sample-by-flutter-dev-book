/// interface修飾子
///
/// 特徴（自身が宣言されたライブラリ以外での場合）← 同一ファイル以外での振る舞いについて
///
/// インスタンス化 OK
/// extendsキーワードによる継承 NG
/// implementsキーワードによる実装 OK

interface class Animal {
  String greet() => 'hello';
}
