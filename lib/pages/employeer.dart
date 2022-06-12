import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobs_ui/helpers/utils.dart';

import '../helpers/UserData.dart';

// ignore: camel_case_types
class employeer extends StatefulWidget {
  final UserData userData;
  const employeer({Key? key, required this.userData}) : super(key: key);

  @override
  _userState createState() => _userState();
}

// ignore: camel_case_types
class _userState extends State<employeer> {
  UserData _userData = UserData.emptyUserData();
  String _profilePictureURL = "";

  _userState() {
    getCurrentUser().then((val) => setState(() {
          _userData = val;
        }));

    _profilePictureURL = basicUserData()!.photoURL.toString();
  }

  Future<UserData> getCurrentUser() async {
    return await UserData.getUserFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.greenAccent,
              child: Center(
                  child: Text(
                "Profil firmowy",
                textScaleFactor: 1.5,
                style: TextStyle(color: Colors.green.shade800),
              )),
            ),
            SizedBox(
                height: 200,
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
//BANER
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
                          "https://www.geekweb.pl/media/k2/items/cache/4fd575b03eae045941eb58c35ab6b353_XL.jpg",
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          height: 200,
                        ),
                      ),
                    ),
//LOGO
                    Positioned(
                      bottom: -35,
                      left: 25,
                      child: Container(
                        child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                  width: 80.0,
                                  height: 80.0,
                                  decoration: new BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.greenAccent.shade700
                                              .withOpacity(0.6),
                                          spreadRadius: 4,
                                          blurRadius: 3,
                                          offset: Offset(0, 0),
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.contain,
                                          image: new NetworkImage(
                                              ("https://smartbrands.pl/wp-content/uploads/2018/01/logo-%C5%BCabka.png"))))),
//ZMIANA ZDJĘCIA
                              Positioned(
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: GestureDetector(
                                        onTap: () {
                                          print('Zmiana profilwoego firmy');
                                        },
                                        child: Container(
                                            width: 28,
                                            height: 23,
                                            color: Colors.lightGreenAccent
                                                .withOpacity(0.9),
                                            child: Icon(
                                              Icons.camera_alt,
                                              size: 18,
                                            )),
                                      )))
                            ]),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
//NAZWA FIRMY
                  Row(
                    children: [
                      Text(
                        "Żabka",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(CupertinoIcons.rosette,
                          color: Colors.greenAccent.shade400)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 38,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
//INFORMACJE O FIRMIE
                  ExpandablePanel(
                    header: Container(
                      child: Row(
                        children: [
                          Text(
                            "Informacje o firmie",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            Icons.info_outline_rounded,
                            color: Colors.greenAccent.shade400,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            CupertinoIcons.gear_solid,
                            color: Colors.greenAccent.shade400,
                          )
                        ],
                      ),
                    ),
                    collapsed: Text(
                      "Grupa Żabka to kompleksowy ekosystem convenience...",
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Text(
                      "Grupa Żabka to kompleksowy ekosystem convenience, którego celem jest upraszczanie ludziom życia. Towarzyszymy konsumentom w każdym momencie dnia, oszczędzając ich czas oraz dając możliwość szybkich zakupów spożywczych, ciepłego posiłku w drodze, wygodnego nadania paczki, wypłaty gotówki, czy skorzystania z dietetycznego cateringu. Jesteśmy jedną z najbardziej rozpoznawalnych marek w Polsce, z której usług korzysta dziennie blisko 3 mln klientów.",
                      softWrap: true,
                    ),
                  ),

                  SizedBox(
                    height: 14,
                  ),

                  SizedBox(height: 6),
//PODSTAWOWE DANE
                  Text(
                    "Podstawowe dane",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Imię",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            _userData.name.split(" ")[0],
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                height: 1.2),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nazwisko",
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            _userData.name.split(" ")[1],
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                height: 1.2),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 32,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Data urodzenia",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500),
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: _userData.birth,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17)),
                            TextSpan(text: '    '),
                            TextSpan(
                                text: '${getAge()} lata',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 17)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Adres",
                    style: TextStyle(
                        color: Colors.grey[800], fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${_userData.city}, ${_userData.addres}",
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700, height: 1.2),
                  ),
                  SizedBox(
                    height: 16,
                  ),
//STAN KONTA
                  Text(
                    "Stan konta",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                      width: double.infinity,
                      height: 80,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          border: Border.all(
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: [
                            Text(
                              "Teraz promocja dla nowych firm!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey[800],
                              ),
                            ),
                            Spacer(),
                            Text("Dodaj ogłoszenie za 0zł",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey[800],
                                ))
                          ],
                        ),
                      )),
                  Wrap(
                      //children:
                      ),
                  SizedBox(
                    height: 16,
                  ),
//REKRUTACJE
                  Text(
                    "Rekrutacje",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => () {},
                            child: Container(
                              height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                    child: 
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "Aktywne rekrutacje",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        Icon(Icons.arrow_forward_ios, color: Colors.blueAccent,),
                                        SizedBox(width: 8,)
                                      ],
                                    )),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () => () {},
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blueAccent,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20))),
                             
                                      child: Row(
                                      children: [
                                        SizedBox(width: 8,),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              "Nowa rekrutacja",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueAccent,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                        Icon(Icons.arrow_forward_ios, color: Colors.blueAccent,),
                                        SizedBox(width: 8,)
                                      ],
                                    ))),
                        ),
                        
                      ]),
                  SizedBox(
                    height: 16,
                  ),
//PODPIĘTE KONTA
                  Row(
                    children: [
                      Text(
                        "Podpięte konta",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Icon(
                        Icons.info_outline_rounded,
                        color: Colors.greenAccent.shade400,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(CupertinoIcons.person_badge_plus,
                        color: Colors.green.shade800),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      primary: Colors.greenAccent, // <-- Button color
                      onPrimary: Colors.green.shade700, // <-- Splash color
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),
//MOJE KONTO
                  Text(
                    "Moje konto",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.grey[800],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  //Guziki usuwania i wylogowania
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size?>(
                                Size(128.0, 40.0)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black.withOpacity(0.6)),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                    width: 1.3,
                                    color: Colors.black.withOpacity(0.6))),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(new Radius.circular(30)),
                                    side: BorderSide(color: Colors.greenAccent)))),
                        onPressed: () {
                          debugPrint('Logged out');
                          FirebaseAuth.instance.signOut();
                        },
                        child: Text(
                          "Wyloguj",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size?>(
                                Size(128.0, 40.0)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(width: 1.3, color: Colors.red)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        new Radius.circular(30)),
                                    side: BorderSide(
                                        color: Colors.greenAccent)))),
                        onPressed: () {
                          //Add removing intro done flag
                          basicUserData()?.delete();
                          debugPrint('Usunięto konto');
                        },
                        child: Text(
                          "Usuń konto",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Oceń nas",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        style: ButtonStyle(
                            animationDuration: Duration(milliseconds: 600),
                            elevation: MaterialStateProperty.all<double?>(7),
                            minimumSize: MaterialStateProperty.all<Size?>(
                                Size(128.0, 40.0)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.green.shade700),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.green.shade200),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.greenAccent),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            new Radius.circular(30)),
                                        side: BorderSide(
                                            color: Colors.greenAccent)))),
                      ),
                      OutlinedButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all<Size?>(
                                Size(128.0, 40.0)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueAccent),
                            side: MaterialStateProperty.all<BorderSide>(
                                BorderSide(
                                    width: 1.3, color: Colors.blueAccent)),
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            new Radius.circular(30)),
                                        side: BorderSide(
                                            color: Colors.greenAccent)))),
                        onPressed: () {
                          showLicensePage(context: context);
                        },
                        child: Text(
                          "Licencje",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  User? basicUserData() {
    final User? user = FirebaseAuth.instance.currentUser;
    print(user?.uid);
    print(user?.providerData);
    print(user?.tenantId);
    print(user?.hashCode);
    print(user?.runtimeType);
    return user; // here you write the codes to input the data into firestore
  }

  String getAge() {
    var now = DateTime.now();
    DateTime tempDate = Intl.withLocale(
        'pl', () => new DateFormat("dd.MM.yyyy").parse(_userData.birth));
    var differece = now.difference(tempDate);
    return (differece.inDays / 365).floor().toString();
  }
}
