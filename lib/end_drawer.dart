import 'package:flutter/material.dart';

class MyEndDrawer extends StatelessWidget {
  const MyEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Text('EndDrawer'),
          ),
          ListTile(
            title: const Text('閉じる'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
