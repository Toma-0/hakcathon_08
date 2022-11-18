import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

//残高と推しの名前、ユーザーネーム、アイコン等を表示

void main() => runApp(
      MaterialApp(
        home: HomePage(),
      ),
    );

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        //leading: SizedBox(

        //child: Card(
        //  child: Row(
        //    children: [
        //    Text("ユーザーネーム"),
        //    Image.asset("images/C_ATM0.PNG"),
        //    ],
        //  ),
        //),
      ),
      body: ATM(),
    );
  }
}

class ATM extends StatefulWidget {
  @override
  _ATMState createState() => _ATMState();
}

class _ATMState extends State<ATM> {
  bool showFirst = true;

  void OpenATM() {
    setState(() {
      showFirst = !showFirst;
      print(showFirst);
    });

    AnimatedCrossFade(
      firstChild: Image.asset("images/C_ATM0.PNG"),
      secondChild: Image.asset("images/C_ATM1.PNG"),
      duration: Duration(seconds: 1),
      crossFadeState:
          showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget creatCard(name, number, c) {
    return TextButton(
      onPressed: () {
        OpenATM();
      },
      child: Card(
        elevation: 0,
        child: Container(
          width: 70,
          height: 70,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/oshi$number.PNG"),
                colorFilter: ColorFilter.mode(c, BlendMode.srcIn),
                scale: 11,
                fit: BoxFit.none,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(name),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        borderRadius:BorderRadius.circular(10),
        panel: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              creatCard("うい", 0, Colors.red),
              Padding(
                padding: EdgeInsets.only(right: 10),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Image.asset("images/C_ATM0.PNG"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
