import 'package:flutter/material.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);

  final imageUrl = 'https://picsum.photos/200/300';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                title: Image.network(imageUrl,height: 100,fit: BoxFit.cover,),
                onTap: (){},
                subtitle: Text('How do you use your card?'),
                leading: Icon(Icons.money),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
