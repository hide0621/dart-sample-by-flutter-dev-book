/// Dartでは1つのDartファイルをライブラリと呼ぶ
/// part命令文で複数のファイルを1つのライブラリとして扱うこともできる
/// 外部のライブラリの名前空間にアクセスするにはimport命令を使う

// Dartの組み込みライブラリは dart: スキームを指定することでインポートできる
// 例えば、dart:math ライブラリは数学関数を提供する
// 以下のasはdart:mathライブラリをmathという名前で参照できるようにする
// これにより、同じ名前の関数やクラスが他のライブラリに存在する場合でも、
// それらが衝突することなく、mathの名前空間を通じてdart:mathライブラリの関数やクラスにアクセスできる。
// 例えば、math.piやmath.powのように使用する。
import 'dart:math' as math;

void List2_10_1() {
  double radius = 5.0;
  double area = math.pi * math.pow(radius, 2);
  print('The area of the circle is: $area');
}
