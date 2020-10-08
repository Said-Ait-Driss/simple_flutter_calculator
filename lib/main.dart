import "package:flutter/material.dart";

void main()=>runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'calculator',
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//____________statefulWidget class
class Calculator extends StatefulWidget{

  State<StatefulWidget> createState(){
    return _Calculator();
  }
}
//___________myMainClass
class _Calculator extends State<Calculator>{

  String text='0';
  double one=0;
  double two=0;
  String result='0';
  String finalResult='0';

  String opr="";
  String preOpr='';

  Widget build(BuildContext context){
    return Scaffold(
      appBar:null,
      backgroundColor: Colors.blueAccent.withOpacity(0.3),
      body: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //__________Row 1 for Text
            Row(
              children: [
                Expanded(
                  child: Text(text,style: TextStyle(color: Colors.white,fontSize: 60),
                  maxLines: 1,
                    textAlign: TextAlign.right,
                  ),

                ),
              ],
            ),
            //__________Row 2 for first Row buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("C",Colors.green,0),
                btn("+/-",Colors.green,0),
                btn("%",Colors.green,0),
                btn("/",Colors.grey,0),

              ],
            ),
            //___________Row 3 for Row buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("7",Colors.brown,0),
                btn("8",Colors.brown,0),
                btn("9",Colors.brown,0),
                btn("X",Colors.grey,0),

              ],
            ),
            //___________Row 4 for Row buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("4",Colors.brown,0),
                btn("5",Colors.brown,0),
                btn("6",Colors.brown,0),
                btn("-",Colors.grey,0),

              ],
            ),
            //___________Row 5 for Row buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("1",Colors.brown,0),
                btn("2",Colors.brown,0),
                btn("3",Colors.brown,0),
                btn("+",Colors.grey,0),

              ],
            ),
            //___________Row 6 for Row buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                btn("0",Colors.brown,12),
                btn(".",Colors.brown,0),
                btn("=",Colors.grey,0),

              ],
            ),


          ],
        ),
      ),
    );
  }

  Widget btn(String text,Color color,int tall){
    if(tall==12){
      return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          onPressed: (){
            calculate(text);
          },
          child:Text(text,style: TextStyle(fontSize: 30),),
          color: color,
          padding: EdgeInsets.only(left: 84,right: 88,bottom: 20,top: 20),
          shape: StadiumBorder(),
        ),
      );
  }
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: RaisedButton(
        onPressed: (){
          calculate(text);
        },
        child: Text(text,style: TextStyle(fontSize: 30),),
        color: color,
        padding: EdgeInsets.all(20),
        shape: CircleBorder(),
      ),
    );
  }


  void calculate(textBtn){
    if(textBtn=='C'){
      text='0';
      one=0;
      two=0;
      finalResult="0";
      opr='';
      preOpr='';
      result='';
    }else if(opr=='='&&textBtn=="="){
      switch(preOpr){
        case '+':add();break;
        case '-':sub();break;
        case 'X':mul();break;
        case '/':div();break;
      }
    }
    else if(textBtn=='+'||textBtn=='-'||textBtn=='X'||textBtn=='/'||textBtn=='='){
      if(one==0){
        one=double.parse(result);
      }else{
        two=double.parse(result);
      }
      switch(opr){
        case '+':finalResult=add();break;
        case '-':finalResult=sub();break;
        case 'X':finalResult=mul();break;
        case '/':finalResult=div();break;
      }


        preOpr = opr;
        opr = textBtn;
        result = '';

    }else if(textBtn=='%'){
      result=(one/100).toString();
      finalResult=result;
    }else if(textBtn=='.'){
      if(result.contains('.')==false)
        result+='.';
      finalResult=result;
    }else if(textBtn=='+/-'){
      result.startsWith('-')? result=result.substring(1):result='-'+result;finalResult=result;
    }
    else{
      if(result=='0')result=textBtn;
      else{result+=textBtn;
      finalResult=result;}
    }

    setState(() {
      text=finalResult;
    });
  }

  String add(){
    result=(one+two).toString();
    one=double.parse(result);
    return todecimale(result);
  }

  String sub(){
    result=(one-two).toString();
    one=double.parse(result);
    return todecimale(result);
  }

  String mul(){
    result=(one*two).toString();
    one=double.parse(result);
    return todecimale(result);
  }

  String div(){
    result=(one/two).toString();
    one=double.parse(result);
    return todecimale(result);
  }
  String todecimale(String _res){
    if(_res.contains('.')){
      var h=_res.split('.');
      if(int.parse(h[1])<0){
        return h[0];
      }
    }
    return _res;
  }

}













