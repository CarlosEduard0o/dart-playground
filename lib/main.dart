import 'package:flutter/material.dart';

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

class ResidentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Visão geral dos pacientes monitorados',
                        style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.width < 600 ? 24 : 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        'Buscar paciente',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width < 600
                                ? 16
                                : 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                      SizedBox(height: 10),
                      SearchBar(
                        leading: Icon(Icons.search),
                        constraints: BoxConstraints(
                            minWidth: 150.0,
                            maxWidth: 400.0,
                            minHeight: 40.0,
                            maxHeight: 60.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                // Expanded(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: [
                //       _AlertCard(),
                //     ],
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 24),
            const Expanded(child: GridResidents()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  onPressed: () {
                    _openForm(context);
                  },
                  label: const Text('Cadastrar paciente'),
                  icon: const Icon(Icons.add),
                )
              ],
            ),
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

class _AlertCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 400,
        maxWidth: 400,
      ),
      child: Card(
        color: const Color.fromARGB(255, 255, 147, 147),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.warning,
                color: const Color.fromARGB(255, 234, 16, 0),
              ),
              title: Text(
                MediaQuery.of(context).size.width < 600
                    ? 'Alertas'
                    : 'Existem alertas ativos',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width < 600 ? 16 : 20,
                ),
              ),
              // trailing: Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
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

class GridResidents extends StatefulWidget {
  const GridResidents({super.key});

  @override
  State<GridResidents> createState() => _GridResidentsState();
}

class _GridResidentsState extends State<GridResidents> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 800;
        final crossAxisCount = isDesktop ? 3 : 1;
        final itemsPerPage = isDesktop ? 12 : 4;

        final allItems = List.generate(30, (index) => index);
        final totalPages = (allItems.length / itemsPerPage).ceil();

        final startIndex = currentPage * itemsPerPage;
        final endIndex = (startIndex + itemsPerPage).clamp(0, allItems.length);
        final currentItems = allItems.sublist(startIndex, endIndex);

        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 120,
                ),
                itemCount: currentItems.length,
                itemBuilder: (context, index) {
                  return const _ResidentCard(
                    cardName: 'Carlos',
                    cardImage: 'assets/images/avatar.png',
                    housingUnit: 'Casa 12',
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: currentPage > 0
                      ? () {
                          setState(() {
                            currentPage--;
                          });
                        }
                      : null,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Página ${currentPage + 1} de $totalPages',
                    style: TextStyle(
                      fontSize: isDesktop ? 16 : 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: currentPage < totalPages - 1
                      ? () {
                          setState(() {
                            currentPage++;
                          });
                        }
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}

void _openForm(BuildContext context) {
  final isMobile = MediaQuery.of(context).size.width < 600;

  if (isMobile) {
    showModalBottomSheet(
      context: context,
      builder: (_) => _buildForm(),
    );
  } else {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Preencher Formulário'),
        content: _buildForm(),
      ),
    );
  }
}

Widget _buildForm() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(decoration: InputDecoration(labelText: 'Nome')),
        TextField(decoration: InputDecoration(labelText: 'Email')),
        ElevatedButton(onPressed: () {}, child: Text('Enviar')),
      ],
    ),
  );
}
