import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white,
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
  int ATMNumber =0;

  void OpenATM() {
    setState(() {
      ATMNumber =1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            OpenATM();
            print(ATMNumber);
          },
          child: Image.asset("images/C_ATM$ATMNumber.PNG")),
    );
  }
}
