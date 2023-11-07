import 'package:flutter/material.dart';

class DynamicDetailScreen extends StatelessWidget {
  final int itemId; // ID item yang akan ditampilkan di layar detail
  DynamicDetailScreen(this.itemId);

  @override
  Widget build(BuildContext context) {
    String itemName = "Item $itemId";
    String itemDescription = "Deskripsi dari Item $itemId";

    return Scaffold(
      appBar: AppBar(title: Text('Detail Item')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nama Item: $itemName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Deskripsi: $itemDescription'),
          ],
        ),
      ),
    );
  }
}
