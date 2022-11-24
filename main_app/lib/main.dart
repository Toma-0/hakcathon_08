import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import './config/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(home: ATM()));
}


class ATM extends StatefulWidget {
  @override
  _ATMState createState() => _ATMState();
}

class _ATMState extends State<ATM> with SingleTickerProviderStateMixin {
  bool sliderClose = true;
  double t = 150;

  Widget creatCard(name, number, c, BuildContext context) {
    SizeConfig().init(context);
    return TextButton(
      onPressed: () {
        //画面遷移
      },
      child: Card(
        elevation: 0,
        color: Color.fromARGB(255, 241, 241, 241),
        child: Container(
          width: 70,
          height: 70,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/oshi$number.PNG"),
                colorFilter: ColorFilter.mode(c, BlendMode.srcIn),
                scale: 10,
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
    SizeConfig().init(context);
    return Scaffold(
      body: SlidingUpPanel(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromARGB(255, 141, 141, 141)),
        minHeight: 50,
        maxHeight: 250,
        onPanelOpened: () {
          setState(() {
            t = 0;
          });
        },
        onPanelClosed: () {
          setState(() {
            t = 150;
          });
        },
        panel: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 17),
              ),
              Card(
                child: Container(
                  color: Color.fromARGB(255, 176, 175, 175),
                  width: 70,
                  height: 5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 17),
              ),
              Container(
                height: 196,
                width: 400,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color.fromARGB(255, 87, 87, 87)),
                    left: BorderSide(color: Color.fromARGB(255, 87, 87, 87)),
                    right: BorderSide(color: Color.fromARGB(255, 87, 87, 87)),
                  ),
                  //追加
                ),
                child: Container(
                  color: Color.fromARGB(255, 241, 241, 241),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                      ),
                      creatCard("うい", 0, Colors.red, context),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Container(
                        height: 50,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("images/black.jpeg"),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text("ユーザー名"), //ユーザーネーム

                      Padding(padding: EdgeInsets.only(left: 250)),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Image.asset("images/ATM.PNG"),
                        ),
                      ),
                    ],
                  ),
                ),
                padding: EdgeInsets.only(top: 50, bottom: 50),
              ),
              Padding(
                padding: EdgeInsets.only(top: t),
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
