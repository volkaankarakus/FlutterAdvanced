import 'package:flutter/material.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({Key? key}) : super(key: key);

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FittedBox( // FittedBox for big devices
            child: Text(
              'Hello',
              style: Theme.of(context).textTheme.headline1,
              maxLines: 1,
            ),
          ),

          Container(color: Colors.red,height: 300,),
          Divider(),
          SizedBox(
            height: 300, // we should give an height value for horizontal listView
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              children: [
                Container(color: Colors.green,width: 100),
                Container(color: Colors.white,width: 100),
                Container(color: Colors.green,width: 100),
                Container(color: Colors.white,width: 100),
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.clear))
        ],
      ),
    );
  }
}
