
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz/provider/quizzProvider.dart';
import 'package:quizz/widget/Boutton.dart';
import 'package:http/http.dart' as http;


class App extends StatefulWidget {

  @override

  State<App> createState() => _AppState();

}

 

class _AppState extends State<App> {

  @override

  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(create: (context)=>QuizzProvider(),
   child: Scaffold(

      appBar: AppBar(

        title: Text("QUIZZ"),

        centerTitle: true,

        backgroundColor: Colors.red,

        elevation: 0,
        

      ),

      body:Column(

     mainAxisAlignment: MainAxisAlignment.spaceBetween,

       //crossAxisAlignment: CrossAxisAlignment.center,

     children: [
          Container(
            alignment: Alignment.topRight,
              child: Consumer<QuizzProvider>(
      
      builder: (context, score, _) {
        String scoreText = '${score.score}/50';
        return 
           Text(scoreText,
           style: TextStyle(fontSize: 22,
           fontWeight: FontWeight.bold
           
           ),
           );
        
      },
    )
          ),
          Container(
          
            child:FutureBuilder(
                       future: getReponse(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  else
                  {
                       Map<String, dynamic> jsonAnalyze= json.decode(snapshot.data);
                       List<dynamic> questionJson = jsonAnalyze['results'];
                       QuizzProvider.text=questionJson;
                         return Consumer<QuizzProvider>(
     
      builder: (context, fournisseur, _) {
       
        return Container(padding: EdgeInsets.only(left: 10),
          child: Text(fournisseur.getQuestion().toString(),
             style: TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.bold, 
          )
          
          ),
        );
      },
    );
                  }
              },
              )          
                        
          ),
         Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Boutton(text: true, color: Colors.green),  Boutton(text: false, color: Colors.red)
           ],
         )),
         Container(
            alignment: Alignment.bottomRight,
              child: Consumer<QuizzProvider>(
      
      builder: (context, fournisseur, _) {
          String progressionText = '${fournisseur.i+1}/10';
          return 
           Text(progressionText,
           style: TextStyle(fontSize:22,fontWeight: FontWeight.bold
           ),
           );
        
      },
     )
      )     

        ],
        

      ),
      
      
    )
    );

  }
  Future<String> getReponse () async{
    String url="https://opentdb.com/api.php?amount=10&category=20&type=boolean";
    var response=await http.get(Uri.parse(url));
    return response.body.toString();
  
  }

}