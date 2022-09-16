import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/data.dart';

//このソースは、ページ遷移を確認するために新規に作成
class Page2Page extends HookConsumerWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Navigator2 example'),
      ),
      body: Center(
        child: Column(
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    print("### NewWindowPage#Widget onPressed3 !");
                    ref.read(kousinProvider.notifier).update((state) => 0);//ここで共通変数更新→ページ切り替え
                  /*
                  //Navigator1.0
                  Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) => const MySecondPage(),
                    ),
                  );
                  */
                  },
                  child: const Text(
                    "戻る",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                ),
            ]
        ),
      ),
    );
  }
}