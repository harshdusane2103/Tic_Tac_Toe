import 'package:flutter/material.dart';
import 'package:tic_tce_toe_ui/utils/global.dart';




class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController player1 = TextEditingController();
  final TextEditingController player2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                height: 260,
                width: 180,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/pro1.png"),
                          )),
                    ),
                    Container(
                      height: 60,
                      width: 180,
                      color: Colors.white,
                      child: TextField(
                        controller: player1,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),

                            hintText: ("Player 1")),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Vs",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: 260,
                width: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/pro2.jpeg"),
                          )),
                    ),
                    Container(
                      height: 60,
                      width: 180,
                      color: Colors.white,
                      child: TextField(
                        controller: player2,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                            ),

                            hintText: ("Player 2")),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50
              ,
            ),
            InkWell(
              onTap: () {
                Player1=player1.text;
                Player2=player2.text;
                Navigator.of(context).pushNamed('/game');
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: (Colors.green)),
                child: Center(
                    child: Text(
                  'Play',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
