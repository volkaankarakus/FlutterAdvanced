import 'package:flutter/material.dart';
import 'package:flutter_advanced/202/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {

  var user8 = PostModel7(body: 'a'); // convert final to var for value changing

  @override
  void initState() {
    super.initState();

    final user1 = PostModel()..userId = 1 ..body ='hello' ;

    final user2 = PostModel2(1,2,'a','b');
    user2.body = 'sdfsfd'; // can be updatable

    final user3 = PostModel3(1,2,'sdf','sdfsdf');
    // user3.body = 'ssdfsdf';  ERROR -> cannot be updatable

    final user4 = PostModel4(userId: 1, id: 2, title: 'hi', body: 'hello');
    // user4.body = 'a';   ERROR

    final user5 = PostModel5(userId: 1, id: 2, title: 'title', body: 'body');
    user5.userId; // consumer can access userId
    // user5.body  ERROR cannot access to body.

    final user6 = PostModel6(); // it has default values.

    // Best for service
    final user7 = PostModel7(body: 'a');


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            user8 = user8.copyWith(title: 'vsadsdf');
          });
        },
      ),
      appBar: AppBar(
        title: Text(user8.title ?? 'Title hasnt any data'),
      ),
    );
  }
}
