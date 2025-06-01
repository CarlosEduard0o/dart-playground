import 'package:flutter/material.dart';
import 'package:namer_app/views/alerts_view.dart';
import 'package:namer_app/views/authentication_view.dart';
import 'package:namer_app/views/reports_view.dart';
import 'package:namer_app/views/residents_view.dart';
import 'package:namer_app/views/settings_dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAGE',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white10,
      ),
      home: Stage(),
    );
  }
}

class Stage extends StatefulWidget {
  @override
  State<Stage> createState() => _StageState();
}

class SageIcon extends StatelessWidget {
  const SageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Ajusta o tamanho com base na largura
    double imageHeight = width < 600 ? 80 : 150;
    double imageWidth = width < 600 ? 56 : 105;

    return Center(
      child: Image.asset(
        'assets/images/icon.png',
        height: imageHeight,
        width: imageWidth,
      ),
    );
  }
}

class _StageState extends State<Stage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = ResidentsPage();
        break;
      case 1:
        page = AlertsPage();
        break;
      case 2:
        page = ReportsPage();
        break;
      case 3:
        page = SettingsPage();
        break;
      case 4:
        page = AuthenticationPage();
        break;
      default:
        throw UnimplementedError('Sem widget para $selectedIndex');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  leading: const SageIcon(),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.emoji_people),
                      label: Text('Residentes'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.warning),
                      label: Text('Alertas'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.description),
                      label: Text('Relatórios'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text('Configurações'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.close),
                      label: Text('Sair'),
                    ),
                  ],
                  backgroundColor: const Color.fromARGB(255, 154, 225, 255),
                  selectedIndex: selectedIndex,
                  groupAlignment: -0.9,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(child: page),
            ],
          ),
        );
      },
    );
  }
}
