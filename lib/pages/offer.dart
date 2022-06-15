import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:jiffy/jiffy.dart';
// import 'package:flutter_osm_interface/src/types/geo_point.dart' as GeoPoint;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Offer extends StatefulWidget {
  const Offer(this.image, this.firma, this.stanowisko, this.typ, this.kasa,
      this.CreatedAt, this.offerDescription, this.miasto, this.umowa,
      {Key? key})
      : super(key: key);
  @override
  _OfferState createState() => _OfferState();
  // ignore: non_constant_identifier_names
  final Timestamp CreatedAt;
  final String image,
      firma,
      stanowisko,
      typ,
      kasa,
      offerDescription,
      miasto,
      umowa;
}

class _OfferState extends State<Offer> {
  String applyText = "Aplikuj";
  bool applied = false;
  String saveText = 'Zapisz do ulubionych';
  bool _savedState = false;
  late String ago;

  // MapController controller = MapController(
  //   initMapWithUserPosition: false,
  //   initPosition: GeoPoint.GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
  //   areaLimit: BoundingBox(
  //     east: 10.4922941,
  //     north: 47.8084648,
  //     south: 45.817995,
  //     west: 5.9559113,
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    ago = Jiffy(widget.CreatedAt.toDate().toString(), "yyyy-MM-dd").fromNow();
    Jiffy.locale("pl");

//TODO : DEEP LINKING SHARE

    return Scaffold(
        body: SlidingUpPanel(
      // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      minHeight: 60,
      panel: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            )),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                width: 30,
                height: 8,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 157, 157, 157),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "TU BĘDĄ INFORMACJE O ${widget.firma}",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      collapsed: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            )),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 30,
                  height: 8,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 157, 157, 157),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              SizedBox(
                height: 10,
              ),
              Text(
                "Więcej informacji o firmie ${widget.firma}",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200,
            child: Stack(alignment: Alignment.center, children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 6,
                      blurRadius: 6,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ]),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: 200,
                  ),
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: ClipOval(
                    child: Material(
                      color: Colors.greenAccent, // Button color
                      child: InkWell(
                        splashColor: Colors.green[700], // Splash color
                        onTap: () {
                          setState(() {
                            _savedState = !_savedState;
                          });
                        },
                        child: SizedBox(
                            width: 46,
                            height: 46,
                            child: _savedState
                                ? Icon(Icons.bookmark_outline)
                                : Icon(Icons.bookmark)),
                      ),
                    ),
                  ))
            ]),
          ),

          SizedBox(height: 8.0),
          Row(
            children: [
              //Tytuł stanowiska
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Text(widget.stanowisko,
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 32.0)),
                ),
              ),
            ],
          ),
          //Firma
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    widget.firma,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.lightGreenAccent.shade700,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                '|',
              ),
              SizedBox(
                width: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Text(
                  ago,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16, 0.0),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 4,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.money_dollar_circle,
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Flexible(
                      child: Text(
                        widget.kasa,
                        style: TextStyle(fontSize: 16.0),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.time,
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Flexible(
                      child: Text(
                        '8 godzinne zmiany',
                        style: TextStyle(fontSize: 16.0),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.assignment_outlined,
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Flexible(
                      child: Text(
                        widget.umowa,
                        style: TextStyle(fontSize: 16.0),
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.location,
                      size: 28.0,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Flexible(
                      child: Text(
                        widget.miasto,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        maxLines: 2,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          //Opis stanowiska
          Padding(
            padding: EdgeInsets.all(16),
            child: MarkdownBody(
              styleSheet: MarkdownStyleSheet(textScaleFactor: 1.15),
              data: """${widget.offerDescription.trimRight()}""",
            ),
          ),
          SizedBox(height: 16.0),

          Center(
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.info_outlined,
                  color: Colors.black.withOpacity(0.5),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  width: 230,
                  child: Text(
                    'Aplikując teraz odpowiedź dostaniesz już w czwartek!',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          //Guzik aplikuj
          Center(
            child: ElevatedButton(
                child: Text(applyText, style: TextStyle(fontSize: 18)),
                style: ButtonStyle(
                    animationDuration: Duration(milliseconds: 600),
                    elevation: MaterialStateProperty.all<double?>(7),
                    minimumSize:
                        MaterialStateProperty.all<Size?>(Size(128.0, 40.0)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.green.shade700),
                    shadowColor:
                        MaterialStateProperty.all<Color>(Colors.green.shade200),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.greenAccent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(30)),
                            side: BorderSide(color: Colors.greenAccent)))),
                onPressed: () => {
                      if (!applied)
                        {
                          setState(() {
                            applied = true;
                            applyText = 'Aplikowano';
                          }),
                          Flushbar(
                            title: "Sukces!",
                            titleColor: Colors.white,
                            message:
                                "Pomyślnie apllikowano! Odpowiedź na aplikację znajdziesz w zakładce czatów",
                            flushbarPosition: FlushbarPosition.TOP,
                            flushbarStyle: FlushbarStyle.FLOATING,
                            reverseAnimationCurve: Curves.decelerate,
                            forwardAnimationCurve: Curves.elasticOut,
                            margin: EdgeInsets.all(8),
                            borderRadius: BorderRadius.circular(8),
                            backgroundColor: Colors.red,
                            boxShadows: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 120, 202, 114),
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 3.0)
                            ],
                            backgroundGradient: LinearGradient(colors: [
                              Colors.greenAccent,
                              Colors.greenAccent
                            ]),
                            isDismissible: true,
                            duration: Duration(seconds: 4),
                            icon: Icon(
                              Icons.celebration_rounded,
                              color: Colors.black,
                              size: 32,
                            ),
                            shouldIconPulse: false,
                            showProgressIndicator: false,
                            titleText: Text(
                              "Sukces!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.amber,
                                  fontFamily: "ShadowsIntoLightTwo"),
                            ),
                            messageText: Text(
                              "Pomyślnie apllikowano! Odpowiedź na aplikację znajdziesz w zakładce czatów",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            ),
                          )..show(context),
                        }
                    }),
          ),
          SizedBox(
            height: 32,
          ),
          SizedBox(height: 120.0),
        ],
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
    ));
  }
}
