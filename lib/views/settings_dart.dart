import 'package:flutter/material.dart';
import 'package:namer_app/components/read_settings_card_component.dart';
import 'package:namer_app/components/title_page_component.dart';
import 'package:namer_app/components/write_settings_card_component.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitlePage(title: 'Configurações'),
            SizedBox(height: 50),
            ReadSettingsCard(
                title: 'IP da central de alarmes',
                info: '192.168.0.55',
                icon: 'lalala'),
            ReadSettingsCard(
                title: 'IP deste computador',
                info: '192.168.0.10',
                icon: 'lalala'),
            WriteSettingsCard(
                title: 'Porta para comunicação com a central de alarmes:',
                icon: Icons.send_outlined),
          ],
        ),
      ),
    );
  }
}
