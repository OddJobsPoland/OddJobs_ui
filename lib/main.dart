import 'dart:math';
import 'package:jobs_ui/pages/chats.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobs_ui/pages/home.dart';
import 'package:jobs_ui/pages/user.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.greenAccent,
      systemNavigationBarColor: Colors.greenAccent));
  runApp(MaterialApp(
    home: MyApp(),
    title: 'OddJobs',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _value;
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 1);

    List<Widget> _buildScreens() {
      return [user(), Home(), Chats()];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.emoji_people),
          title: ("Konto"),
          activeColorPrimary: Colors.greenAccent,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.auto_awesome_motion_outlined),
          title: ("Oferty"),
          activeColorPrimary: Colors.greenAccent,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.forum_rounded),
          title: ("Czaty"),
          activeColorPrimary: Colors.greenAccent,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    List<String> options = ['wózki widłowe', 'sanepid', 'ketegoria b'];

    List<PageViewModel> _introScreenPages() {
      return [
        PageViewModel(
          title: "Witaj w {app_name}!",
          body: "Pomożemy Ci znaleźć pracę marzeń już w 3 dni!",
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
                labelStyle: TextStyle(color: Colors.green),
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
                labelStyle: TextStyle(color: Colors.green),
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
            DropdownButton<String>(
              value: "Warszawa",
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30), right: Radius.circular(30)),
              isExpanded: true,
              alignment: AlignmentDirectional.centerStart,
              elevation: 16,
              style: const TextStyle(color: Colors.green),
              underline: Container(
                height: 0,
                color: Colors.greenAccent,
              ),
              onChanged: (String? newValue) {
                // setState(() {
                //   dropdownValue = newValue!;
                // });
              },
              items: <String>[
                'Warszawa',
                'Poznań',
                'Wrocław',
                'Gdańsk',
                'Kraków',
                'Białystok',
                'Katowice',
                'Rzeszów'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              width: 1,
              height: 28,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Adres zamieszkania',
                labelStyle: TextStyle(color: Colors.green),
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
                labelStyle: TextStyle(color: Colors.green),
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
                  options.length,
                  (int idx) {
                    return ChoiceChip(
                        label: Text(options[idx]),
                        selected: _value == idx,
                        onSelected: (bool selected) {
                          // setState(() {
                          //   _value = selected ? idx : null;
                          // });
                        });
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
                    " @{app_name}",
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

    var prefs;
    Future<void> _onIntroEnd(context) async {
      prefs = await SharedPreferences.getInstance();
      await prefs.setBool('IntroDone', true);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => _tabView()),
      );
    }

    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(providerConfigs: [
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                clientId:
                    '852126047148-mgv95rk76cl5ir548uqtn2k3fg60e9mv.apps.googleusercontent.com',
              )
            ]);
          }
          bool? isIntroDone = prefs?.getBool('IntroDone') ?? true;
          return isIntroDone!
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
        });
  }
}
