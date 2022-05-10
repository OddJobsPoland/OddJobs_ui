import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';
// ignore: unused_import
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Offer extends StatefulWidget {
  const Offer(this.image, this.firma, this.stanowisko, this.typ, this.kasa,
      this.CreatedAt, this.miasto, this.umowa,
      {Key? key})
      : super(key: key);
  @override
  _OfferState createState() => _OfferState();
  // ignore: non_constant_identifier_names
  final Timestamp CreatedAt;
  final String image, firma, stanowisko, typ, kasa, miasto, umowa;
}

class _OfferState extends State<Offer> {
  String mk = """
  # Drogerie natura 🌿
*to dynamicznie rozwijająca się sieć sklepów drogeryjno - kosmetycznych.* 
## Obecnie prowadzimy rekrutację na stanowisko: 
### **KONSULTANT/SPRZEDAWCA** 
  (mile widziani studenci oraz osoby uczące się)
                                      
  **Miejsce pracy:** 🏢
                                      
Legnica ul. Piłsudskiego 84(Carrefour)
                                      
Jeśli masz w sobie dużo pozytywnej energii, kochasz pracę z ludźmi, a
                                       branża kosmetyczna to Twoja pasja...dołącz do Nas..czekamy na Ciebie !!!
                                      
###  **Co możemy Ci zaoferować:**
                                      
* stabilne zatrudnienie, pracę w pełnym wymiarze godzin;
 * elastyczny czas pracy;⌚
* praktyczny program wdrożenia;👷
 * szkolenia z zakresu kosmetologii i obsługi klienta;👆
 * szkolenia e-learningowe;🧑‍💻
 * stałe wynagrodzenie + premia ;💵
  * możliwość rozwoju zawodowego i awansu.💰
                                      
 ### **Ważne dla Nas, żebyś posiadał:**
                                      
* Doświadczenie w sprzedaży i w kontakcie z Klientem;💖
* Uprzejmość oraz zorientowanie na Klienta;👍
* Otwartość i komunikatywność;🗣️
* Umiejętność pracy zespołowej;🤼
* Sumienność i odpowiedzialność;😇
* Wysoka motywacja wewnętrzna;💪
* Kreatywność, inicjatywa i zaangażowanie w wykonywanie powierzonych zadań.😎""";

  String applyText = "Aplikuj";
  String saveText = 'Zapisz do ulubionych';
  late String ago;
  @override
  Widget build(BuildContext context) {
    ago = Jiffy(widget.CreatedAt.toDate().toString(), "yyyy-MM-dd").fromNow();
    Jiffy.locale("pl");
    return Scaffold(
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
                      onTap: () {},
                      child: SizedBox(
                          width: 46,
                          height: 46,
                          child: Icon(Icons.bookmark_outline)),
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
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 32.0)),
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
            data: mk,
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
                    setState(() {
                      applyText = 'Aplikowano';
                    }),
                    Fluttertoast.showToast(
                      msg:
                          "Pomyslnie wysłano CV, możesz sprawdzić postęp w zakładce czaty🥂🥂",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.black.withOpacity(0.1),
                      timeInSecForIosWeb: 1,
                    ),
                  }),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(height: 40.0),
        // SlidingUpPanel(
        //   panel: Center(
        //     child: Text("This is the sliding Widget"),
        //   ),
        //   collapsed: Container(
        //     decoration: BoxDecoration(
        //         color: Colors.blueGrey,
        //         borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(24.0),
        //           topRight: Radius.circular(24.0),
        //         )),
        //     child: Center(
        //       child: Text(
        //         "This is the collapsed Widget",
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ),
        //   ),
        //   body: Center(
        //     child: Text("This is the Widget behind the sliding panel"),
        //   ),
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(24.0),
        //     topRight: Radius.circular(24.0),
        //   ),
        // ),
      ],
    ));
  }
}
