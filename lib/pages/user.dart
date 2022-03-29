import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/UserData.dart';

// ignore: camel_case_types
class user extends StatefulWidget {
  final UserData userData;
  const user({Key? key, required this.userData}) : super(key: key);

  @override
  _userState createState() => _userState();
}

// ignore: camel_case_types
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
                                    text: UserData.persistentUserData.name
                                        .split(" ")[0],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40)),
                                TextSpan(text: '  '),
                                TextSpan(
                                    text: UserData.persistentUserData.name
                                        .split(" ")[1],
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
                          UserData.persistentUserData.name.split(" ")[0],
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
                          UserData.persistentUserData.name.split(" ")[1],
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
                          color: Colors.grey[800], fontWeight: FontWeight.w500),
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
                              text: UserData.persistentUserData.birth,
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
                  "${UserData.persistentUserData.city}, ${UserData.persistentUserData.addres}",
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
                Wrap(
                  children: List<Widget>.generate(
                    UserData.persistentUserData.attributes.length,
                    (int idx) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Chip(
                            labelStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            elevation: 7,
                            shadowColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)],
                            label: Text(
                                "${UserData.persistentUserData.attributes[idx]}"),
                            backgroundColor:
                                Color(Random().nextInt(0xffffffff))),
                      );
                    },
                  ).toList(),
                ),
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
                      //Add removing intro done flag
                      basicUserData()?.delete();
                      debugPrint('Usunięto konto');
                    },
                    child: Text(
                      "Usuń konto",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                Center(
                  child: OutlinedButton(
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size?>(Size(128.0, 40.0)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueAccent),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(width: 1.3, color: Colors.blueAccent)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(new Radius.circular(30)),
                                side: BorderSide(color: Colors.greenAccent)))),
                    onPressed: () {
                      //Add removing intro done flag
                      showLicensePage(context: context);
                      debugPrint('Showing licences');
                    },
                    child: Text(
                      "Licencje",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                Center(
                  child: OutlinedButton(
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size?>(Size(128.0, 40.0)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueAccent),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(width: 1.3, color: Colors.blueAccent)),
                        shape: MaterialStateProperty
                            .all<RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(new Radius.circular(30)),
                                side: BorderSide(color: Colors.greenAccent)))),
                    onPressed: () {
                      //Add removing intro done flag
                      showAboutDialog(context: context);
                      debugPrint('Showing abouts');
                    },
                    child: Text(
                      "O aplikacji",
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
        'pl',
        () => new DateFormat("dd.MM.yyyy")
            .parse(UserData.persistentUserData.birth));
    var differece = now.difference(tempDate);
    return (differece.inDays / 365).floor().toString();
  }
}
