import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // ListViewBuilder doesn't try to load all elements like listView at once
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                Expanded(
                    child: Image.network('https://picsum.photos/200')
                ),
                Text('$index')
              ],
            ),
          );
        },
        itemCount: 12,
      ),
    );
  }
}
