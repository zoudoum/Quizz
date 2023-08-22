
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/provider/quizzProvider.dart';

class Boutton extends StatefulWidget{
  final bool text;
  final Color color;

  Boutton({
    required this.text,
    required this.color
  });
  @override
  State<StatefulWidget> createState()=>_BouttonState ();

}
class _BouttonState extends State<Boutton>{
  @override
  Widget build(BuildContext context) {
     final questions =Provider.of<QuizzProvider>(context,listen: false) ;
    // TODO: implement build
  return ElevatedButton(onPressed: (){
    questions.nextQuestion(widget.text);

  }, 
  child: Text(widget.text.toString()),

  style: ElevatedButton.styleFrom(
        primary: widget.color, 
        fixedSize: Size(100, 60),
      ), 
  
  );
  }

}