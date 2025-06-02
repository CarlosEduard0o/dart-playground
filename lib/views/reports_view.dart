import 'package:flutter/material.dart';
import 'package:namer_app/components/title_page_component.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitlePage(title: 'Relatório'),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
