import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:jobs_ui/pages/user.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class MainIntro extends StatefulWidget {
  const MainIntro({Key? key}) : super(key: key);

  @override
  _MainIntroState createState() => _MainIntroState();
}

class _MainIntroState extends State<MainIntro> {
  SharedPreferences? _sharedPreferneces;
  bool isIntroDone = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic> userAttributes = Map<String, dynamic>();
  List<String> citiesAvailable = [];
  List<String> selectedChoices = [];
  String dropdownValue = "Warszawa";

  //ASYNC

  _MainIntroState() {
    getSharedPreferences()
        .then((val) => setState(() {
              _sharedPreferneces = val;
            }))
        .then((value) => getIntroDoneValue().then((val) => setState(() {
              isIntroDone = val!;
            })))
        .then((value) =>
            readAvailableUserAttributes().then((value) => setState(() {
                  userAttributes = value;
                })))
        .then((value) => readAvailableCities().then((value) => setState(() {
              citiesAvailable =
                  value.entries.map((e) => e.value.toString()).toList();
            })));
  }

  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool?> getIntroDoneValue() async {
    return _sharedPreferneces!.getBool('IntroDone') == null
        ? await _sharedPreferneces!.setBool('IntroDone', true)
        : _sharedPreferneces!.getBool('IntroDone');
  }

  //END ASYNC

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 1);

    List<Widget> _buildScreens() {
      return [user(), Home(), Placeholder()];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.emoji_people),
          title: ("Konto"),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: Color.fromARGB(255, 77, 201, 141),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.auto_awesome_motion_outlined),
          title: ("Oferty"),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: Color.fromARGB(255, 77, 201, 141),
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.forum_rounded),
          title: ("Czaty"),
          activeColorPrimary: Colors.amber,
          inactiveColorPrimary: Color.fromARGB(255, 77, 201, 141),
        ),
      ];
    }

    List<PageViewModel> _introScreenPages() {
      return [
        PageViewModel(
          title: "Witaj w OddJobs!",
          body:
              "Pomożemy Ci znaleźć pracę marzeń już w 3 dni! Jesteśmy agregatem ofert pracy dla niebieskich kołnierzyków, zajęć typowo miejskich. Zależny nam na tym, żeby udało Ci się znaleźć pracę jak najszybciej, więc pracodawca jest zobligowany odpowiedzieć na twoją aplikację w max 3 dni i możliwe, że zaprosić Cię na rozmowę😏",
          image: Image.asset("assets/sitting-1@2x.png"),
        ),
        PageViewModel(
          title: "Bogaty profil jest najważniejszy",
          bodyWidget: Column(children: [
            Text(
              "Im więcej inforamcji nam o sobie podasz, tym atrakcyjniejszy będzie twój profil dla potencjalnego pracodawcy",
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 1,
              height: 26,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Jak się nazywasz',
                labelStyle: TextStyle(color: Colors.blueGrey),
                focusColor: Colors.green,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 4.0),
                ),
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              style: TextStyle(fontWeight: FontWeight.bold),
              showCursor: true,
              cursorColor: Colors.amber,
              cursorWidth: 3,
              cursorRadius: Radius.circular(45),
            ),
            SizedBox(
              width: 1,
              height: 28,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Numer telefonu',
                labelStyle: TextStyle(color: Colors.blueGrey),
                focusColor: Colors.green,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 4.0),
                ),
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              style: TextStyle(fontWeight: FontWeight.bold),
              showCursor: true,
              cursorColor: Colors.amber,
              cursorWidth: 3,
              cursorRadius: Radius.circular(45),
            ),
            SizedBox(
              width: 1,
              height: 28,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 2.0,
                      style: BorderStyle.solid,
                      color: Colors.greenAccent),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              child: DropdownButton<String>(
                value: dropdownValue,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(10), right: Radius.circular(10)),
                isExpanded: true,
                alignment: AlignmentDirectional.centerStart,
                elevation: 16,
                //style: const TextStyle(fontWeight: FontWeight.bold),
                underline: Container(
                  height: 0,
                  color: Colors.greenAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue == null ? "Poznań" : newValue;
                  });
                },
                items: citiesAvailable.map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val.toString(),
                      child: Text(val),
                    );
                  },
                ).toList(),
              ),
            ),
            SizedBox(
              width: 1,
              height: 28,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Adres zamieszkania',
                labelStyle: TextStyle(color: Colors.blueGrey),
                focusColor: Colors.green,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 4.0),
                ),
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              style: TextStyle(fontWeight: FontWeight.bold),
              showCursor: true,
              cursorColor: Colors.amber,
              cursorWidth: 3,
              cursorRadius: Radius.circular(45),
            ),
            SizedBox(
              width: 1,
              height: 28,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Data urodzin',
                labelStyle: TextStyle(color: Colors.blueGrey),
                focusColor: Colors.green,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 4.0),
                ),
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              style: TextStyle(fontWeight: FontWeight.bold),
              showCursor: true,
              cursorColor: Colors.amber,
              cursorWidth: 3,
              cursorRadius: Radius.circular(45),
            ),
          ]),
          image: Image.asset("assets/sitting-4.png"),
        ),
        PageViewModel(
          title: "Twoje mocne strony",
          bodyWidget: Column(
            children: [
              Text(
                "Wybierz kilka swoich umiejętności, każda kolejna zwiększa twoje szanse na znalezienie pracy. \n\nNie martw się jeśli nie ma tu nic dla Ciebie, zawsze możesz się doszkolić i edytować swój profil później 😉",
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 1,
                height: 8,
              ),
              Wrap(
                children: List<Widget>.generate(
                  userAttributes.length,
                  (int idx) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ChoiceChip(
                          selected: selectedChoices.contains(
                              userAttributes["${idx + 1}"].toString()),
                          label: Text(userAttributes["${idx + 1}"].toString()),
                          selectedColor: Colors.greenAccent.shade100,
                          shadowColor: Colors.teal,
                          backgroundColor: Colors.white,
                          side: BorderSide(
                              color: Colors.greenAccent.shade100, width: 1.8),
                          elevation: 4,
                          pressElevation: 0.1,
                          onSelected: (bool selected) {
                            setState(() {
                              print(selectedChoices);
                              print(selected);
                              selectedChoices.contains(
                                      userAttributes["${idx + 1}"].toString())
                                  ? selectedChoices.remove(
                                      userAttributes["${idx + 1}"].toString())
                                  : selectedChoices
                                      .add(userAttributes["${idx + 1}"]);
                            });
                          }),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
          image: Image.asset("assets/standing-23@2x.png"),
        ),
        PageViewModel(
          title: "Zostańmy w kontakcie",
          bodyWidget: Column(
            children: [
              Text(
                "Jeśli masz jakieś pytania, sugestie czy poroblemy, napisz do nas. Jesteśmy otwarci😎",
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 1,
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.twitter, size: 20.0),
                  Text(
                    " @OddJobs",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
          image: Image.asset("assets/standing-22.png"),
        )
      ];
    }

    PersistentTabView _tabView() {
      return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(5.0),
            colorBehindNavBar: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.lightGreen.shade900.withOpacity(0.3),
                spreadRadius: 9,
                blurRadius: 12,
                offset: Offset(0, 3),
              )
            ]),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInExpo,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.easeInOutExpo,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style12,
      );
    }

    Future<void> _onIntroEnd(context) async {
      await _sharedPreferneces!.setBool('IntroDone', false);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => _tabView()),
      );
    }

    return !isIntroDone
        ? _tabView()
        : IntroductionScreen(
            pages: _introScreenPages(),
            onDone: () {
              _onIntroEnd(context);
            },
            showBackButton: true,
            back: const Icon(Icons.arrow_back),
            backSemantic: "Wróć",
            nextSemantic: "Dalej",
            doneSemantic: "Gotowe!",
            isTopSafeArea: true,
            isBottomSafeArea: true,
            showSkipButton: false,
            next: const Icon(Icons.navigate_next_outlined),
            done: const Text("Done",
                style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Colors.amberAccent,
                color: Colors.black26,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
          );
  }

  Future<Map<String, dynamic>> readAvailableUserAttributes() async {
    var collection = FirebaseFirestore.instance.collection('UserAttributes');
    var docSnapshot = await collection.doc('ListOfUserAttribues').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      return data;
    }
    return Map<String, dynamic>();
  }

  Future<Map<String, dynamic>> readAvailableCities() async {
    var collection = FirebaseFirestore.instance.collection('AppAttributes');
    var docSnapshot = await collection.doc('CitiesAvailable').get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data()!;
      return data;
    }
    return Map<String, dynamic>();
  }
}
