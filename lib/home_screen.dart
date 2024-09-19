import 'package:flutter/material.dart';

import 'end_drawer.dart';
import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? _lastOpenedDrawer; // true = Drawer, false = EndDrawer

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // Scaffold に key を設定

      appBar: AppBar(title: const Text('Drawer and EndDrawer Example')),
      drawer: const MyDrawer(),
      endDrawer: const MyEndDrawer(),
      onDrawerChanged: (isOpened) {
        if (isOpened) {
          // ドロワーが開かれた時に、どちらが開かれたかを記録
          if (_scaffoldKey.currentState!.isDrawerOpen) {
            _lastOpenedDrawer = true;
            print('通常のDrawerが開かれました');
          } else if (_scaffoldKey.currentState!.isEndDrawerOpen) {
            _lastOpenedDrawer = false;
            print('EndDrawerが開かれました');
          }
        } else {
          // ドロワーが閉じられた時に、最後に開かれたドロワーがどちらかを確認
          if (_lastOpenedDrawer == true) {
            print('通常のDrawerが閉じられました');

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('通常のDrawerが閉じられました')),
            );
          } else if (_lastOpenedDrawer == false) {
            print('EndDrawerが閉じられました');
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('EndDrawerが閉じられました')),
            );
          }
          // 状態をリセット
          _lastOpenedDrawer = null;
        }
      },
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('通常のDrawerを開く'),
              onPressed: () {
//                Scaffold.of(context).openDrawer();
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('EndDrawerを開く'),
              onPressed: () {
//                Scaffold.of(context).openEndDrawer();
                _scaffoldKey.currentState!.openEndDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}
