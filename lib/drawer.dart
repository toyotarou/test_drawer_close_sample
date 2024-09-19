import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Text('通常のDrawer'),
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
