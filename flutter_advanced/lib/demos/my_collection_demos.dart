import 'package:flutter/material.dart';

class MyCollectionDemos extends StatefulWidget {
  const MyCollectionDemos({Key? key}) : super(key: key);

  @override
  State<MyCollectionDemos> createState() => _MyCollectionDemosState();
}

class _MyCollectionDemosState extends State<MyCollectionDemos> {

  late final List<CollectionModel> _items;

  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _items.length,
          padding: PaddingUtility().paddingSymmetric,
          itemBuilder: (context, index) {
            return _CategoryCard(model: _items[index]);
          },),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    Key? key,
    required CollectionModel model,
  }) : _model = model, super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: PaddingUtility().paddingAllCard,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                      _model.imagePath,
                  fit: BoxFit.cover,
                  )
              ),
              Padding(
                padding: PaddingUtility().paddingTop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(_model.title),
                    Text('${_model.price} ETH')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionModel{
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({required this.imagePath,required this.title,required this.price});
}

class CollectionItems{

  late final List<CollectionModel> items; // late -> value will come later but only at constructor time
  // If it was 'late final' it just takes the constructor instantly and its value doesn't change, just used


  CollectionItems(){
    items = [
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstract Art',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstract Art2',
          price: 3.8),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstract Art3',
          price: 4.2),
      CollectionModel(
          imagePath: ProjectImages.imageCollection,
          title: 'Abstract Art4',
          price: 1.4),
    ];
  }
}

class PaddingUtility{
  final paddingTop = EdgeInsets.only(top: 10);
  final paddingSymmetric = EdgeInsets.symmetric(horizontal: 20);
  final paddingAllCard = EdgeInsets.all(8.0);
  final paddingBottom = EdgeInsets.only(bottom: 30);
}

class ProjectImages{
  static const imageCollection = 'assets/png/image_collection.png';
}
