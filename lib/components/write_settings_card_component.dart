import 'package:flutter/material.dart';

class WriteSettingsCard extends StatelessWidget {
  const WriteSettingsCard({
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(title),
            subtitle: TextField(decoration: InputDecoration()),
            trailing: TextButton(onPressed: () {}, child: Icon(icon)),
          ),
        ],
      ),
    );
  }
}
