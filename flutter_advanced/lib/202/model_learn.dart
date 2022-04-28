// METHOD 1
// variables can be null on fetching process.
class PostModel1{
  int? userId;
  int? id;
  String? title;
  String? body;
}

// METHOD 2
// forming a constructor
class PostModel2{
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title, this.body);
}

// METHOD 3
// variables can ONLY fetch on constructor time and can be initialize.
class PostModel3{
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}

// METHOD 4
// If we want the customer to enter these values (named parameters)
class PostModel4{
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId,required this.id,required this.title,required this.body});
}

// *** METHOD 5 ****
// Values are taken from the customer but not returned
class PostModel5{
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  int get userId => _userId;

  PostModel5({
    required int userId,
    required int id,
    required String title,
    required String body}) : _userId = userId, _id = id, _title=title, _body=body;

}

// METHOD 6
// giving a initial default value
class PostModel6{
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({
    int userId = 0,
    int id = 0,
    String title = '',
    String body = ''}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

// ****** METHOD 7 ******** (BEST FOR NETWORK DATA)
// If the model is not created locally;
//   For example, we created a textfield, but we do not fill it.
class PostModel7 {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostModel7({this.userId, this.id, this.title, this.body});


  PostModel7 copyWith({ // it preserves other values when one value changes

    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel7(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
