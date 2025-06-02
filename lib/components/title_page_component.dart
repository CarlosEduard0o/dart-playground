import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget {
  const TitlePage({
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width < 600 ? 24 : 32,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
    );
  }
}
