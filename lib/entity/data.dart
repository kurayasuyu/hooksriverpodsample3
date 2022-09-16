//hooks_riverpodを利用するための宣言
import 'package:hooks_riverpod/hooks_riverpod.dart';

//Providerの宣言
final counterProvider = StateNotifierProvider<Counter, int>((_) => Counter());

//Providerに紐づいたクラスと関数
class Counter extends StateNotifier<int> {
  Counter() : super(0);//stateを０で初期化

  //increment()関数が呼ばれたら、stateの数字を＋1する。
  void increment() => state++;

  //カウンターの値が指定値に変更出来る関数を作る
  void setIncrement( int intData ){
    state = intData;
  }
}

//ページを切り替えるための共通変数//Navigator2.0の状態変数
final kousinProvider = StateProvider((ref) => 0);

class Kousin {

  static void update(int intPageID) {
    // kousinProviderを更新する
    StateProvider((ref) {
      ref.read(kousinProvider.notifier).state = intPageID;
    });
  }//static void update

}