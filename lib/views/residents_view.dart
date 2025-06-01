import 'package:flutter/material.dart';
import 'package:namer_app/components/alert_card_component.dart';
import 'package:namer_app/components/resident_card_component.dart';

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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AlertCard(),
                    ],
                  ),
                ),
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
                  return const ResidentCard(
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
