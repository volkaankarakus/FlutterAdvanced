import 'package:flutter/material.dart';
import 'package:flutter_advanced/202/service/comment_model.dart';
import 'package:flutter_advanced/202/service/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({Key? key,this.postId}) : super(key: key);
  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {

  late final IPostService postService;
  bool _isLoading = false;
  List<CommentModel>? _commentItems;

  @override
  void initState() {
    super.initState();
    postService = PostServices();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void _changeLoading(){
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchItemsWithId(int postId)async{
    _changeLoading();
    _commentItems = await postService.fetchRelatedCommentsWithPostId(postId);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _commentItems?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Text(_commentItems?[index].email ?? ''),
          );
        },
      ),
    );
  }
}
