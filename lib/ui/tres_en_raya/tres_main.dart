import 'dart:math';

import 'package:app_upeu/apis/resultado_api.dart';
import 'package:app_upeu/comp/CustomAppBar.dart';
import 'package:app_upeu/comp/CustomButton.dart';
import 'package:app_upeu/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainTresEnRaya extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Provider<ResultadoApi>(
      create: (_) => ResultadoApi.create(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: AppTheme.useLightMode ? ThemeMode.light : ThemeMode.dark,
        theme: AppTheme.themeData,
        //theme: ThemeData(primaryColor: Colors.lightBlue),
        home: MainTresEnRayaPage(),
      ),
    );
  }
}

class MainTresEnRayaPage extends StatefulWidget {
  @override
  TicTacToeState createState() => TicTacToeState();
}

class TicTacToeState extends State<MainTresEnRayaPage> {
  bool buttonenabled = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerJ1 = new TextEditingController();
  TextEditingController _controllerJ2 = new TextEditingController();
  final List<String> entries = <String>['1', '2', '3', '4'];
  final List<String> entries2 = <String>['Empate', 'Juan', 'xx', 'yy'];
  final List<String> entries3 = <String>['T', 'T', 'A', 'J'];
  final List<String> entries4 = <String>['0', '1', '0', '0'];
  List labelList = [" ", " ", " ", " ", " ", " ", " ", " ", " "];
  bool enableDisable = false;
  bool enableDisableTxt = true;
  String turno = "";
  String ganador = "";
  bool clickTurno = false;
  int chance_flag = 0;

  void accion() {
    setState(() {
      AppTheme.colorX = Colors.blue;
    });
  }

  void btnInicio() {
    labelList.replaceRange(0, 9, ["", "", "", "", "", "", "", "", ""]);
    ganador = "";
    enableDisable = true;
    chance_flag = 0;
    Random rnd = new Random();
    int min = 13, max = 42;
    int r = min + rnd.nextInt(max - min);
    if (r % 2 == 0) {
      turno = "J1:${_controllerJ1.value.text}-(X)";
    } else {
      turno = "J2:${_controllerJ2.value.text}-(O)";
    }
  }

  void btnAnular() {
    labelList.replaceRange(0, 9, ["", "", "", "", "", "", "", "", ""]);
    enableDisable = false;
    turno = "";
  }

  void numClick(String text, int index) {
    setState(() {
      if (text == "") {
        chance_flag += 1;
      }
      start(index);
      matchCheck();
      print(
          "ver txt: ${text} index: ${index} num val: ${labelList[index]} cant:${chance_flag}");
    });
  }

  void start(int index) {
    var parts = turno.split(':');
    if (parts[0].trim() == "J1" && clickTurno == false) {
      labelList[index] = "X";
      clickTurno = true;
      turno = "J2:${_controllerJ2.value.text}-(O)";
    } else {
      labelList[index] = "O";
      clickTurno = false;
      turno = "J1:${_controllerJ1.value.text}-(X)";
    }
  }

  void matchCheck() {
    if ((labelList[0] == "X") &&
        (labelList[1] == "X") &&
        (labelList[2] == "X")) {
      xWins();
    } else if ((labelList[0] == "X") &&
        (labelList[4] == "X") &&
        (labelList[8] == "X")) {
      xWins();
    } else if ((labelList[0] == "X") &&
        (labelList[3] == "X") &&
        (labelList[6] == "X")) {
      xWins();
    } else if ((labelList[1] == "X") &&
        (labelList[4] == "X") &&
        (labelList[7] == "X")) {
      xWins();
    } else if ((labelList[2] == "X") &&
        (labelList[4] == "X") &&
        (labelList[6] == "X")) {
      xWins();
    } else if ((labelList[2] == "X") &&
        (labelList[5] == "X") &&
        (labelList[8] == "X")) {
      xWins();
    } else if ((labelList[3] == "X") &&
        (labelList[4] == "X") &&
        (labelList[5] == "X")) {
      xWins();
    } else if ((labelList[6] == "X") &&
        (labelList[7] == "X") &&
        (labelList[8] == "X")) {
      xWins();
    } else if ((labelList[0] == "O") &&
        (labelList[1] == "O") &&
        (labelList[2] == "O")) {
      oWins();
    } else if ((labelList[0] == "O") &&
        (labelList[3] == "O") &&
        (labelList[6] == "O")) {
      oWins();
    } else if ((labelList[0] == "O") &&
        (labelList[4] == "O") &&
        (labelList[8] == "O")) {
      oWins();
    } else if ((labelList[1] == "O") &&
        (labelList[4] == "O") &&
        (labelList[7] == "O")) {
      oWins();
    } else if ((labelList[2] == "O") &&
        (labelList[4] == "O") &&
        (labelList[6] == "O")) {
      oWins();
    } else if ((labelList[2] == "O") &&
        (labelList[5] == "O") &&
        (labelList[8] == "O")) {
      oWins();
    } else if ((labelList[3] == "O") &&
        (labelList[4] == "O") &&
        (labelList[5] == "O")) {
      oWins();
    } else if ((labelList[6] == "O") &&
        (labelList[7] == "O") &&
        (labelList[8] == "O")) {
      oWins();
    } else if (chance_flag == 9) {
      enableDisable = false;
      ganador = "Empate";
      turno = "Termino";
      enableDisableTxt = true;
      buttonenabled = false;
      //donde se registre el juego
    }
  }

  void xWins() {
    ganador = "J1:${_controllerJ1.value.text}-(X)";
    enableDisable = false;
    turno = "Termino";
    buttonenabled = false;
    enableDisableTxt = true;
  }

  void oWins() {
    ganador = "J2:${_controllerJ2.value.text}-(O)";
    enableDisable = false;
    turno = "Termino";
    buttonenabled = false;
    enableDisableTxt = true;
  }

  @override
  Widget build(BuildContext context) {
    List funx = [
      numClick,
      numClick,
      numClick,
      numClick,
      numClick,
      numClick,
      numClick,
      numClick,
      numClick
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: CustomAppBar(accionx: accion as Function),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                ),
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: TextField(
                                  enabled: enableDisableTxt ? true : false,
                                  controller: _controllerJ2,
                                  decoration: InputDecoration(
                                    labelText: 'Jugador 1',
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: TextField(
                                  enabled: enableDisableTxt ? true : false,
                                  controller: _controllerJ1,
                                  decoration: InputDecoration(
                                    labelText: "Jugador 2",
                                  )),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: buttonenabled
                                          ? null
                                          : () {
                                              setState(() {
                                                //setState to refresh UI
                                                if (buttonenabled) {
                                                  buttonenabled = false;
                                                  //if buttonenabled == true, then make buttonenabled = false
                                                } else {
                                                  btnInicio();
                                                  enableDisableTxt = false;
                                                  buttonenabled = true;
                                                  //if buttonenabled == false, then make buttonenabled = true
                                                }
                                              });
                                            },
                                      child: Text('Inicio'),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: buttonenabled
                                          ? () {
                                              setState(() {
                                                //setState to refresh UI
                                                if (buttonenabled) {
                                                  btnAnular();
                                                  enableDisableTxt = true;
                                                  buttonenabled = false;
                                                  //if buttonenabled == true, then make buttonenabled = false
                                                } else {
                                                  buttonenabled = true;
                                                  //if buttonenabled == false, then make buttonenabled = true
                                                }
                                              });
                                            }
                                          : null,
                                      child: Text('Anular'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5),
                      children: [
                        ...List.generate(
                          labelList.length,
                          (indexx) => CustomButton(
                            text: labelList[indexx],
                            index: indexx,
                            buttonenabled: enableDisable,
                            callback: funx[indexx] as Function,
                          ),
                        ),
                      ],
                      shrinkWrap: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: <Widget>[
                              OutlinedButton(
                                  onPressed: null,
                                  child: Text('Jugador: $turno'))
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              OutlinedButton(
                                  onPressed: null,
                                  child: Text('Ganador: $ganador'))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Text(
                            'TABLA DE PUNTAJES',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Partida 1'),
                                  Text('Ganador: Empate')
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Text('100 pts'),
                                      ),
                                      Container(
                                        child: Text('Empate'),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Partida 1'),
                                  Text('Ganador: Empate')
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Text('100 pts'),
                                      ),
                                      Container(
                                        child: Text('Empate'),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Partida 1'),
                                  Text('Ganador: Empate')
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20.0),
                                        child: Text('100 pts'),
                                      ),
                                      Container(
                                        child: Text('Empate'),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
