import 'package:flutter/material.dart';

class ReadSettingsCard extends StatelessWidget {
  const ReadSettingsCard({
    required this.title,
    required this.info,
    required this.icon,
  });

  final String title;
  final String info;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(title),
            subtitle: Text(info),
            trailing: Icon(Icons.album),
          ),
        ],
      ),
    );
  }
}
