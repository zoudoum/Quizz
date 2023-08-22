

import 'dart:math';

import 'package:flutter/material.dart';

class QuizzProvider extends ChangeNotifier {
  static late List<dynamic> text;
  int score=0;
  Random random = Random();

  int i = 0;
  

  getQuestion()
  {
    if (i < text.length) { 
    return text[i]['question'];
  }
  }
 
  nextQuestion(bool t) {
    if (i < text.length-1) {
    print(text[i]['correct_answer']);
    print(t);
    //print('tttt'+t.toString());
    if(text[i]['correct_answer'].toString().toLowerCase()==t.toString().toLowerCase()){
      score=score+5;
    }
    
   
      i++;
      //scurrentText = text[i];

      notifyListeners();
    }
    
  }
}





