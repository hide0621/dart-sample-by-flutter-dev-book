/// package:スキームは、pub.devで公開されているパッケージをインポートするためのスキーム
/// 仮にLibraries_and_Visibility.dartをパッケージとして扱いたい場合、
/// libディレクトリに移動させ、package:スキームを使用してインポートすることができる
/// その場合、現在使用しているプロジェクトがmy_projectであると仮定すると、インポート文は次のようになる

// import 'package:my_project/Libraries_and_Visibility.dart';

/// この変更を行うなら、pubspec.yamlファイルにパッケージの依存関係を追加する必要がある

// プロジェクト内のローカルファイルなら、相対パスまたは絶対パスを使用してインポートできる
import 'Libraries_and_Visibility.dart';

/// pub.devはDartとFlutterのパッケージを公開、共有、そして検索するための公式のパッケージマネージャー
/// 開発者は自分が作成したパッケージをpub.devに"パブリッシュ"（公開）することで、他の開発者がそれを利用できるようにする
/// 開発者はoub.devから必要なパッケージを検索し、自分のプロジェクトに追加することができる
/// これはpackage:スキームを使用して行われ、pubspec.yamlファイルにパッケージの依存関係を追加することで実現する

void main() {
  // List2_10_1();
  // publicFunction(); // publicな関数なので呼び出し可能
  // _internalFunction(); // privateな関数なのでエラーになる
  List2_10_2();
}
