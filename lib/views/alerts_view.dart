import 'package:flutter/material.dart';
import 'package:namer_app/components/title_page_component.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: MediaQuery.of(context).size.width < 600 ? 0 : 50.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitlePage(title: 'Alertas'),
            SizedBox(height: 50),
            SingleChildScrollView(
                padding: EdgeInsets.all(12.0), child: DataTableExample()),
            TextButton(onPressed: (() {}), child: Text('Exportar relatório'))
          ],
        ),
      ),
    );
  }
}

class MyDataSource extends DataTableSource {
  static const List<int> _displayIndexToRawIndex = <int>[0, 3, 4, 5, 6];

  late List<List<Comparable<Object>>> sortedData;
  void setData(List<List<Comparable<Object>>> rawData, int sortColumn,
      bool sortAscending) {
    sortedData = rawData.toList()
      ..sort((List<Comparable<Object>> a, List<Comparable<Object>> b) {
        final Comparable<Object> cellA = a[_displayIndexToRawIndex[sortColumn]];
        final Comparable<Object> cellB = b[_displayIndexToRawIndex[sortColumn]];
        return cellA.compareTo(cellB) * (sortAscending ? 1 : -1);
      });
    notifyListeners();
  }

  @override
  int get rowCount => sortedData.length;

  static DataCell cellFor(Object data) {
    String value;
    if (data is DateTime) {
      value =
          '${data.year}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}';
    } else {
      value = data.toString();
    }
    return DataCell(Text(value));
  }

  @override
  DataRow? getRow(int index) {
    if (index >= sortedData.length) return null; // EVITA CRASH

    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        cellFor(sortedData[index][0]), // Nome
        cellFor(sortedData[index][1]), // Unidade Habitacional
        cellFor(sortedData[index][2]), // Motivo
        cellFor(sortedData[index][3]), // Data
        cellFor(sortedData[index][4]), // Procedimento
        cellFor(sortedData[index][5]),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  final MyDataSource dataSource = MyDataSource()..setData(episodes, 0, true);

  int _columnIndex = 0;
  bool _columnAscending = true;

  void _sort(int columnIndex, bool ascending) {
    setState(() {
      _columnIndex = columnIndex;
      _columnAscending = ascending;
      dataSource.setData(episodes, _columnIndex, _columnAscending);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      sortColumnIndex: _columnIndex,
      sortAscending: _columnAscending,
      columns: <DataColumn>[
        DataColumn(label: const Text('Nome'), onSort: _sort),
        DataColumn(label: const Text('Unidade Habitacional'), onSort: _sort),
        DataColumn(label: const Text('Motivo'), onSort: _sort),
        DataColumn(label: const Text('Data'), onSort: _sort),
        DataColumn(label: const Text('Procedimento'), onSort: _sort),
        DataColumn(label: const Text('Status'), onSort: _sort),
      ],
      source: dataSource,
    );
  }
}

final List<List<Comparable<Object>>> episodes = <List<Comparable<Object>>>[
  <Comparable<Object>>[
    'Eduardo Carlos',
    'Casa 01',
    'Dor de cabeça',
    '01/06/2025',
    '30 gotas de dipirona',
    'Alerta',
  ],
  <Comparable<Object>>[
    'Augusto',
    'Casa 02',
    'Dor de coluna',
    '01/06/2025',
    'Dorflex',
    'Alerta',
  ],
  <Comparable<Object>>[
    'Francisco',
    'Casa 03',
    'Dor de estômago',
    '01/06/2025',
    'Remédio para Dor de estômago',
    'Em andamento',
  ],
  <Comparable<Object>>[
    'Leandro',
    'Casa 04',
    'Dor de cabeça',
    '01/06/2025',
    '30 gotas de dipirona',
    'Concluído',
  ],
  <Comparable<Object>>[
    'Alan',
    'Casa 05',
    'Dor de ouvido',
    '01/06/2025',
    'Antinflamatório',
    'Concluído',
  ],
  <Comparable<Object>>[
    'Enderson',
    'Casa 06',
    'Dor de barriga',
    '01/06/2025',
    'Remédio para dor de barriga',
    'Concluído',
  ],
  <Comparable<Object>>[
    'Luffy',
    'Casa 11',
    'Dor de cabeça',
    '01/06/2025',
    '30 gotas de dipirona',
    'Concluído',
  ],
  <Comparable<Object>>[
    'Tereza',
    'Casa 15',
    'Pressão alta',
    '01/06/2025',
    'Remédio para pressão alta',
    'Concluído',
  ],
  <Comparable<Object>>[
    'Catarina',
    'Casa 21',
    'Dor de cabeça',
    '01/06/2025',
    '30 gotas de dipirona',
    'Concluído',
  ],
];
