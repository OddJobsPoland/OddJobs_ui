import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:jobs_ui/helpers/UserData.dart';
import 'package:jobs_ui/pages/employeer.dart';

class userToCompanyTransition extends StatefulWidget {
  const userToCompanyTransition({Key? key}) : super(key: key);

  @override
  State<userToCompanyTransition> createState() =>
      _userToCompanyTransitionState();
}

class _userToCompanyTransitionState extends State<userToCompanyTransition> {
  UserData newUser = UserData.emptyUserData();

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages() {
      return [
        PageViewModel(
          // image: Center(
          //   child: Image.asset(
          //     'assets/images/userToCompanyTransition.png',
          //     width: 200.0,
          //     height: 200.0,
          //   ),
          // ),
          title: "Oferty",
          body: "Znajdź pracę, którą chcesz zrealizować.",
          decoration: const PageDecoration(
            pageColor: Colors.white,
          ),
        ),
        PageViewModel(
          // image: Center(
          //   child: Image.asset(
          //     'assets/images/userToCompanyTransition.png',
          //     width: 200.0,
          //     height: 200.0,
          //   ),
          // ),
          title: "Oferty",
          body: "Znajdź pracę, którą chcesz zrealizować.",
          decoration: const PageDecoration(
            pageColor: Colors.white,
          ),
        ),
        PageViewModel(
          // image: Center(
          //   child: Image.asset(
          //     'assets/images/userToCompanyTransition.png',
          //     width: 200.0,
          //     height: 200.0,
          //   ),
          // ),
          title: "Oferty",
          body: "Znajdź pracę, którą chcesz zrealizować.",
          decoration: const PageDecoration(
            pageColor: Colors.white,
          ),
        ),
      ];
    }

    return IntroductionScreen(
      pages: pages(),
      onDone: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute<void>(
                builder: (BuildContext context) =>
                    employeer(userData: newUser)),
            (Route<dynamic> route) => false);
      },
      showNextButton: true,
      next: const Icon(Icons.navigate_next_outlined),
      done: const Text("Załóż konto!",
          style: TextStyle(fontWeight: FontWeight.w600)),
      showBackButton: true,
      back: const Icon(Icons.navigate_before_outlined),
      backSemantic: "Wróć",
      nextSemantic: "Dalej",
      doneSemantic: "Gotowe!",
      isTopSafeArea: true,
      isBottomSafeArea: true,
      showSkipButton: false,
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
}
