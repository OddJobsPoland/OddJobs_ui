import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jobs_ui/helpers/filters.dart';
import 'package:jobs_ui/helpers/offerCard.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late OffersList offers;
  @override
  void initState() {
    var offersJson = jsonDecode("""
[
{
  "image": "https://bi.im-g.pl/im/24/45/19/z26499876ICR,Pawel-Jan-Majewski---nowy-prezes-Zarzadu-PGNiG-S-A.jpg",
  "firma": "Korpo",
  "stanowisko": "Team leader",
  "typ": "Manger",
  "kasa": "12.000 zł/msc",
  "miasto": "Raszyn",
  "umowa": "B2B"
},
{
  "image": "https://wordpress1672848.home.pl/img/1920x0-resize/drogerie%20natura-5-2.jpg",
  "firma": "Drogerie Natura",
  "stanowisko": "Sprzedawca",
  "typ": "Pracownik fizyczny",
  "kasa": "19zł/h",
  "miasto": "Warszawa, Targówek, głębocka 15",
  "umowa": "Umowa zlecenie"
},
{
  "image": "https://www.warszawa.pl/wp-content/uploads/2016/11/Arriva_solaris_testy-1-790x395.jpg",
  "firma": "Arriva sp. z.o.o",
  "stanowisko": "Kierowca Autobusu",
  "typ": "Pracownik fizyczny",
  "kasa": "29zł/h",
  "miasto": "Warszawa, Wola",
  "umowa": "Umowa o pracę"
},
{
  "image": "https://ocdn.eu/pulscms-transforms/1/nTNk9kuTURBXy8yNWY2NzAwNC0yMGYxLTQzYzEtODE3MS0xYzhmZTRiYWY1N2YuanBlZ5GVAs0BigDDw4GhMAE",
  "firma": "Szkoła podstawowa",
  "stanowisko": "Nauczyciel/ka",
  "typ": "Specjalista",
  "kasa": "3800 zł/miesiąc",
  "miasto": "Pruszków, Marii 3",
  "umowa": "Umowa o pracę"
},
{
  "image": "https://upload.wikimedia.org/wikipedia/en/1/1a/Programming_Examples_in_Prolog.png",
  "firma": "Startup",
  "stanowisko": "Programista prolog",
  "typ": "Specjalista",
  "kasa": "135 zł/h",
  "miasto": "Warszawa, Rondo ONZ",
  "umowa": "B2B"
},
{
  "image": "https://juwentus.pl/media/pracownicy/20180926Juventus1278.jpg",
  "firma": "Ochrona",
  "stanowisko": "Pracownik Ochrony",
  "typ": "Pracownik fizyczny",
  "kasa": "18zł/h",
  "miasto": "Warszawa, Praga południe",
  "umowa": "Umowa o pracę"
}
]
""");

    offers = new OffersList.fromJson(offersJson);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          " Oferty",
          style: TextStyle(
              color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.w900),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 2.0),
              child: IconButton(
                  onPressed: () {
                    showBarModalBottomSheet(
                        context: context,
                        builder: (context) => Filters(),
                        topControl: SizedBox(
                          height: 130,
                        ));
                  },
                  icon: Icon(
                    Icons.filter_alt,
                    color: Colors.black.withOpacity(0.85),
                    size: 30.0,
                  ))),
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.bookmark,
                    color: Colors.black.withOpacity(0.85),
                    size: 30.0,
                  )))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.separated(
            itemCount: offers.offers.length,
            itemBuilder: (context, index) => NewsCard(
              offers.offers[index].image,
              offers.offers[index].firma,
              offers.offers[index].stanowisko,
              offers.offers[index].typ,
              offers.offers[index].kasa,
              offers.offers[index].miasto,
              offers.offers[index].umowa,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 24.0),
          )),
    );
  }
}

class OffersList {
  final List<Offer> offers;

  OffersList({
    required this.offers,
  });

  factory OffersList.fromJson(List<dynamic> parsedJson) {
    List<Offer> offers = List<Offer>.empty(growable: true);
    offers = parsedJson.map((i) => Offer.fromJson(i)).toList();

    return new OffersList(offers: offers);
  }
}

class Offer {
  final String image;
  final String firma;
  final String stanowisko;
  final String typ;
  final String kasa;
  final String miasto;
  final String umowa;

  Offer(
      {required this.image,
      required this.firma,
      required this.stanowisko,
      required this.typ,
      required this.kasa,
      required this.miasto,
      required this.umowa});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return new Offer(
      image: json['image'].toString(),
      firma: json['firma'].toString(),
      stanowisko: json['stanowisko'].toString(),
      typ: json['typ'].toString(),
      kasa: json['kasa'].toString(),
      miasto: json['miasto'].toString(),
      umowa: json['umowa'].toString(),
    );
  }
}
