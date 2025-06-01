import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white10,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class SageIcon extends StatelessWidget {
  const SageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/icon.png',
        height: 150,
        width: 105,
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = ResidentsPage();
        break;
      case 1:
        page = PatientsPage();
        break;
      case 2:
        page = AlertsPage();
        break;
      case 3:
        page = ReportsPage();
        break;
      case 4:
        page = SettingsPage();
        break;
      case 5:
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
                      icon: Icon(Icons.home),
                      label: Text('Residentes'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Pacientes'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Alertas'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Relatórios'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Configurações'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
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

class ResidentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Visão geral dos pacientes monitorados'),
                      SizedBox(height: 8),
                      Text('Buscar paciente'),
                      SizedBox(height: 8),
                      SearchBar(leading: Icon(Icons.search)),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Existem alertas ativos'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Cadastrar Paciente'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Expanded(child: GridResidents()),
          ],
        ),
      ),
    );
  }
}

class _ResidentCard extends StatelessWidget {
  const _ResidentCard({
    required this.cardName,
    required this.cardImage,
    required this.housingUnit,
  });

  final String cardName;
  final String cardImage;
  final String housingUnit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Image.asset(
                cardImage,
                height: 100,
                width: 70,
              ),
              title: Text(cardName),
              subtitle: Text(housingUnit),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('DETALHES'),
                  onPressed: () {},
                ),
                const SizedBox(width: 2),
                TextButton(
                  child: const Text('ATENDER'),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Página de Pacientes'));
  }
}

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Página de Alertas'));
  }
}

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Página de Relatórios'));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Página de Configurações'));
  }
}

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Página de Autenticação'));
  }
}

class GridResidents extends StatelessWidget {
  const GridResidents({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 5,
      children: List.generate(10, (index) {
        return const _ResidentCard(
          cardName: 'Carlos',
          cardImage: 'assets/images/avatar.png',
          housingUnit: 'Casa 12',
        );
      }),
    );
  }
}
