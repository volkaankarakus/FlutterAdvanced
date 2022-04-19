import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({Key? key}) : super(key: key);

  final _title = 'Create your first note';
  final _description = 'Add a note';
  final _elevatedButtonText = 'Create a note';
  final _textButtonText = 'Import Notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            _TitleWidget(title: _title),
            Padding(
              padding: PaddingItems.verticalPadding,
              child: _SubtitleWidget(
                  title: _description, textAlign: TextAlign.left),
            ),
            Spacer(),
            _createButton(context),
            _TextButtonWidget(text: _textButtonText),
            SizedBox(
              height: ButtonHeights.buttonNormalHeight,
            )
          ],
        ),
      ),
    );
  }


  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: SizedBox(
            height: ButtonHeights.buttonNormalHeight,
            child: Center(
                child: Text(
              _elevatedButtonText,
              style: Theme.of(context).textTheme.headline5,
            ))));
  }
}

// Center text widget but it's align can costumized
class _SubtitleWidget extends StatelessWidget {
  const _SubtitleWidget(
      {Key? key,
      required this.title,
      this.textAlign = TextAlign.center // default : TextAlign.center
      })
      : super(key: key);

  final TextAlign textAlign;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title * 8,
      textAlign: textAlign,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w300),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
    );
  }
}

class _TextButtonWidget extends StatelessWidget {
  const _TextButtonWidget({Key? key,required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text(text));
  }
}



class PaddingItems {
  static final EdgeInsets horizontalPadding =
      EdgeInsets.symmetric(horizontal: 20);

  static final EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
}

class ButtonHeights {
  static const double buttonNormalHeight = 50.0;
}
