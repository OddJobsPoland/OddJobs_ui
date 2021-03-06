import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobs_ui/helpers/userToCompanyTransition.dart';
import 'package:jobs_ui/helpers/utils.dart';

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
                                  image: new NetworkImage((_profilePictureURL !=
                                          "null")
                                      ? _profilePictureURL
                                      : "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png")))),
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
                            'Dzie?? dobry',
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
                                    text: _userData.name.split(" ")[0],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40)),
                                TextSpan(text: '  '),
                                TextSpan(
                                    text: _userData.name.split(" ")[1],
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
                    """S??ucham, rozmawiam, rozumiem. Psycholog biznesu, zaufany Partner i wsparcie dla Biznesu oraz Pracownik??w, coach.""",
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
                          "Imi??",
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
                    _userData.attributes.length,
                    (int idx) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 9.0),
                        child: Chip(
                            labelStyle: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            elevation: 7,
                            shadowColor:
                                colors[Random().nextInt(colors.length)],
                            label: Text("${_userData.attributes[idx]}"),
                            backgroundColor:
                                colors[Random().nextInt(colors.length)]),
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
                        ' Mo??esz tutaj wgrywa?? swoje w??asne pliki, jak na przyk??ad CV w formie pdf, czy certyfiakty. B??d?? one dost??pne dla pracodawc??w',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.upload_outlined,
                          color: Colors.green.shade800),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                        primary: Colors.greenAccent, // <-- Button color
                        onPrimary: Colors.green.shade700, // <-- Splash color
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
                  height: 12,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => userToCompanyTransition()),
                      );
                    },
                    child: Text("Zacznij zatrudnia??",
                        style: TextStyle(fontSize: 18)),
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
                                  borderRadius:
                                      BorderRadius.all(new Radius.circular(30)),
                                  side:
                                      BorderSide(color: Colors.greenAccent)))),
                      onPressed: () {
                        //Add removing intro done flag
                        basicUserData()?.delete();
                        debugPrint('Usuni??to konto');
                      },
                      child: Text(
                        "Usu?? konto",
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
                      child: Text("Oce?? nas", style: TextStyle(fontSize: 18)),
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
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(new Radius.circular(30)),
                                  side:
                                      BorderSide(color: Colors.greenAccent)))),
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size?>(
                              Size(128.0, 40.0)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueAccent),
                          side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(width: 1.3, color: Colors.blueAccent)),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(new Radius.circular(30)),
                                  side:
                                      BorderSide(color: Colors.greenAccent)))),
                      onPressed: () {
                        //Add removing intro done flag
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
        'pl', () => new DateFormat("dd.MM.yyyy").parse(_userData.birth));
    var differece = now.difference(tempDate);
    return (differece.inDays / 365).floor().toString();
  }
}
