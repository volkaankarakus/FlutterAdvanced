import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({Key? key}) : super(key: key);

  final String text = 'Food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          Center(
            child:
            SizedBox(
              width: MediaQuery.of(context).size.width,
                child: customElevatedButton(title: text,onPressed:(){},)),
          ),
          SizedBox(height: 30,),
          customElevatedButton(title: text, onPressed: (){}),
        ],
      ),
    );
  }
}

class customElevatedButton extends StatelessWidget {
  const customElevatedButton({
    Key? key,required this.title,required this.onPressed
  }) : super(key: key);

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: _ColorUtility().redColor,
          shape: StadiumBorder()
      ),

      onPressed: onPressed,
      child: Padding(
        padding: _PaddingUtility().normal2xPadding,
        child: Text(title,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
            color: _ColorUtility().whiteColor,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class _ColorUtility{
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility{
   final EdgeInsets normalPadding = EdgeInsets.all(8.0);
   final EdgeInsets normal2xPadding = EdgeInsets.all(16.0);
}
