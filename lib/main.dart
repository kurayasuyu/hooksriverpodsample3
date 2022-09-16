import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'entity/data.dart';
import 'view/myhome.dart';
import 'view/page2.dart';

//ここが一番最初に動く
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

//class MyApp extends StatelessWidget {
class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Widget build(BuildContext context) {
    int intPageID = ref.watch(kousinProvider);
    //return const MaterialApp(
    return MaterialApp(
      //home: MyHomePage(),
        home: Navigator(//Navigator2.0の登録
          pages: [
            const MaterialPage(//初期起動ページ設定
              key: ValueKey('ListPage'),
              child: MyHomePage(),
            ),

            if (intPageID == 1)
            const MaterialPage(
              key: ValueKey('ListPage2'),
              child: Page2Page(),
            ),

          ],
          onPopPage: (route, result) {//Navigator2.0これも必須
            if (!route.didPop(result)) {
              return false;
            }
            ref.read(kousinProvider.state).state = 0;
            return true;
          },
        ),
    );
  }
}