// dartでのドキュメントコメントの書き方

///
/// 引数の値を２倍にして返す
///
/// この関数は引数の値を２倍にして返す関数です。
/// 引数を半分にする仮数を返す関数として[half]関数があります。
int doubleValue(int value) {
  return value * 2;
}

/**
 * 引数の値を半分にして返す
 *
 * この関数は引数の値を半分にして返す関数です。
 * 引数を２倍にする関数として[doubleValue]関数があります。
 */
double half(double value) {
  return value / 2;
}
