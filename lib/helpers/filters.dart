import 'package:syncfusion_flutter_core/theme.dart';

///Slider import
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  double _activeSliderValue = 50;

  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Filtrowanie ofert",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Icon(
                    Icons.leaderboard_rounded,
                    color: Colors.deepPurple[300],
                    size: 26,
                  ),
                  Text(
                    " Typ pracy",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ChoiceChip(
                        selectedColor: Colors.greenAccent.shade100,
                        selected: _selected,
                        onSelected: (bool selected) {
                          setState(() {
                            _selected = !_selected;
                          });
                        },
                        elevation: 4,
                        pressElevation: 0.1,
                        shadowColor: Colors.teal,
                        avatar: _selected
                            ? Icon(
                                Icons.check,
                                color: Colors.green.shade700,
                              )
                            : null,
                        labelStyle: TextStyle(
                          color:
                              _selected ? Colors.green.shade700 : Colors.black,
                        ),
                        side: BorderSide(
                            color: Colors.greenAccent.shade100, width: 1.8),
                        label: Text("Prace podstawowe"),
                        backgroundColor: Colors.white),
                    SizedBox(
                      width: 6,
                    ),
                    Chip(
                        side: BorderSide(
                            color: Colors.green.shade200, width: 1.8),
                        label: Text("Prace specjalistyczne"),
                        backgroundColor: Colors.white),
                    SizedBox(
                      width: 6,
                    ),
                    Chip(
                        side: BorderSide(
                            color: Colors.green.shade200, width: 1.8),
                        label: Text("Stanowiska managerskie"),
                        backgroundColor: Colors.white),
                    SizedBox(
                      width: 6,
                    ),
                    Chip(
                        side: BorderSide(
                            color: Colors.green.shade200, width: 1.8),
                        label: Text("Zajęcia kreatywne"),
                        backgroundColor: Colors.white),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Icon(
                    Icons.school_rounded,
                    color: Colors.teal[300],
                    size: 26,
                  ),
                  Text(
                    " Wymagane wykształcenie",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Chip(
                        side: BorderSide(
                            color: Colors.green.shade200, width: 1.8),
                        label: Text("Zawodowe"),
                        backgroundColor: Colors.white),
                    SizedBox(
                      width: 6,
                    ),
                    Chip(
                      side:
                          BorderSide(color: Colors.green.shade200, width: 1.8),
                      label: Text("Średnie"),
                      backgroundColor: Colors.white60,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Chip(
                        side: BorderSide(
                            color: Colors.green.shade200, width: 1.8),
                        label: Text("Wyższe"),
                        backgroundColor: Colors.white),
                    SizedBox(
                      width: 6,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Icon(
                    Icons.alarm_on_outlined,
                    color: Colors.pink[600],
                    size: 26,
                  ),
                  Text(
                    " Wymiar godzin",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Chip(
                        side: BorderSide(
                            color: Colors.green.shade200, width: 1.8),
                        label: Text("Pełny etat"),
                        backgroundColor: Colors.white),
                    SizedBox(
                      width: 6,
                    ),
                    Chip(
                      side:
                          BorderSide(color: Colors.green.shade200, width: 1.8),
                      label: Text("Część etatu"),
                      backgroundColor: Colors.white60,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Chip(
                        side: BorderSide(
                            color: Colors.green.shade200, width: 1.8),
                        label: Text("Pojedyńcze zlecenie"),
                        backgroundColor: Colors.white),
                    SizedBox(
                      width: 6,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Icon(
                    Icons.cake_rounded,
                    color: Colors.yellow[800],
                    size: 26,
                  ),
                  Text(
                    " Wynagrodzenie",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("19zł/h",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  Expanded(
                    child: SfSliderTheme(
                        data: SfSliderThemeData(
                            tooltipTextStyle: TextStyle(
                                color: Colors.green[800],
                                fontWeight: FontWeight.bold),
                            tooltipBackgroundColor: Colors.greenAccent[400],
                            thumbColor: Colors.greenAccent[400]),
                        child: SfSlider(
                          inactiveColor: Colors.greenAccent,
                          activeColor: Colors.greenAccent[400],
                          min: 19.0,
                          max: 150.0,
                          stepSize: 1,
                          interval: 1,
                          onChanged: (dynamic values) {
                            setState(() {
                              _activeSliderValue = values as double;
                            });
                          },
                          value: _activeSliderValue,
                          enableTooltip: true,
                          shouldAlwaysShowTooltip: false,
                          tooltipShape: const SfPaddleTooltipShape(),
                        )),
                  ),
                  Text("150zł/h",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Szukaj", style: TextStyle(fontSize: 18)),
                  style: ButtonStyle(
                      animationDuration: Duration(milliseconds: 600),
                      elevation: MaterialStateProperty.all<double?>(7),
                      minimumSize:
                          MaterialStateProperty.all<Size?>(Size(128.0, 40.0)),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade700),
                      shadowColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade200),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.greenAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(new Radius.circular(30)),
                              side: BorderSide(color: Colors.greenAccent)))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
