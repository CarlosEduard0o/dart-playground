import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
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
