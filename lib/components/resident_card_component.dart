import 'package:flutter/material.dart';

class ResidentCard extends StatelessWidget {
  const ResidentCard({
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
