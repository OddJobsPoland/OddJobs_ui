import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  _userState createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(alignment: AlignmentDirectional.bottomEnd, children: [
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
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(
                                      basicUserData()!.photoURL.toString())))),
                      Positioned(
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: GestureDetector(
                                onTap: () {
                                  print('Zmiana profilwoego');
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
                    SizedBox(
                      width: 38,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dzień dobry',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.4),
                                fontWeight: FontWeight.w500,
                                wordSpacing: 3,
                                letterSpacing: 1.1),
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
                                    text: basicUserData()!
                                        .displayName
                                        ?.split(" ")[0],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40)),
                                TextSpan(text: '  '),
                                TextSpan(
                                    text: basicUserData()!
                                        .displayName
                                        ?.split(" ")[1],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 26)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    """Słucham, rozmawiam, rozumiem. Psycholog biznesu, zaufany Partner i wsparcie dla Biznesu oraz Pracowników, coach.""",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Twoje CV",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                    ),
                    IconButton(
                      onPressed: () => print("Ustawienia"),
                      icon: Icon(CupertinoIcons.gear_solid),
                      iconSize: 28,
                    ),
                  ],
                ),
                SizedBox(height: 6),
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
                          basicUserData()!.displayName!.split(" ")[0],
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
                          basicUserData()!.displayName!.split(" ")[1],
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
                                  text: '15.08.1999',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17)),
                              TextSpan(text: '    '),
                              TextSpan(
                                  text: '23 lata',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 17)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Adres",
                  style: TextStyle(
                      color: Colors.grey[800], fontWeight: FontWeight.w500),
                ),
                Text(
                  "Warszawa, Mickiewicza 14",
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700, height: 1.2),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Atrybuty",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Wrap(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 1, 3, 1),
                    child: Chip(
                        elevation: 7,
                        label: Text("Prawo jazdy kat B"),
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 1, 3, 1),
                    child: Chip(
                        elevation: 7,
                        label: Text("Status studenta"),
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 1, 3, 1),
                    child: Chip(
                        elevation: 7,
                        label: Text("Książeczka sanepidowska"),
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 1, 3, 1),
                    child: Chip(
                        elevation: 7,
                        label: Text("Zaszczepiony/a"),
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 1, 3, 1),
                    child: Chip(
                        elevation: 7,
                        label: Text("Pozwolenie na wózki widłowe"),
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 1, 3, 1),
                    child: Chip(
                        elevation: 7,
                        label: Text("Niekarany/a"),
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 1, 3, 1),
                    child: Chip(
                        elevation: 7,
                        label: Text("Polski natywny"),
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3.0, 1, 3, 1),
                    child: Chip(
                        elevation: 7,
                        label: Text("Angielski C1"),
                        backgroundColor: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)]),
                  ),
                ]),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Pliki",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.info_outlined,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        ' Możesz tutaj wgrywać swoje własne pliki, jak na przykład CV w formie pdf, czy certyfiakty. Będą one dostępne dla pracodawców',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(
                  height: 16,
                ),
                Text(
                  "Moje konto",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Oceń nas", style: TextStyle(fontSize: 18)),
                    style: ButtonStyle(
                        animationDuration: Duration(milliseconds: 600),
                        elevation: MaterialStateProperty.all<double?>(7),
                        minimumSize:
                            MaterialStateProperty.all<Size?>(Size(128.0, 40.0)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.green.shade700),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.green.shade200),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.greenAccent),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(new Radius.circular(30)),
                                side: BorderSide(color: Colors.greenAccent)))),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: OutlinedButton(
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size?>(Size(128.0, 40.0)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.black.withOpacity(0.6)),
                        side: MaterialStateProperty.all<BorderSide>(BorderSide(
                            width: 1.3, color: Colors.black.withOpacity(0.6))),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(new Radius.circular(30)),
                                side: BorderSide(color: Colors.greenAccent)))),
                    onPressed: () {
                      debugPrint('Logged out');
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text(
                      "Wyloguj",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                //Guzik USUŃ KONTO
                Center(
                  child: OutlinedButton(
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size?>(Size(128.0, 40.0)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(width: 1.3, color: Colors.red)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(new Radius.circular(30)),
                                side: BorderSide(color: Colors.greenAccent)))),
                    onPressed: () {
                      debugPrint('Usunięto konto');
                    },
                    child: Text(
                      "Usuń konto",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  User? basicUserData() {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user?.uid;
    return user; // here you write the codes to input the data into firestore
  }
}
