import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  UserData(
      {required this.addres,
      required this.attributes,
      required this.authId,
      required this.birth,
      required this.city,
      required this.name,
      required this.phone});

  final String addres;
  final List<String> attributes;
  String authId;
  final String birth;
  final String city;
  String name;
  String phone;

  UserData.fromJson(Map<String, Object?> json)
      : this(
          addres: json['addres']! as String,
          attributes: json['attributes']! as List<String>,
          authId: json['authId']! as String,
          birth: json['birth']! as String,
          city: json['city']! as String,
          name: json['name']! as String,
          phone: json['phone']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'addres': addres,
      'attributes': attributes,
      'authId': authId,
      'birth': birth,
      'city': city,
      'name': name,
      'phone': phone,
    };
  }

  static UserData emptyUserData() {
    return UserData(
        addres: '',
        attributes: [],
        authId: '',
        birth: '11.01.2000',
        city: '',
        name: 'Imie Naziwsko',
        phone: '');
  }

  static UserData persistentUserData = emptyUserData();

  static Future<void> saveUserInPrefs(UserData userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('currentUser', <String>[
      userData.addres,
      userData.authId,
      userData.birth,
      userData.city,
      userData.name,
      userData.phone
    ]);
    await prefs.setStringList('currentUserAttributes', userData.attributes);
    print("User saved in prefs successfully");
  }

  static Future<UserData> getUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? currentUser = prefs.getStringList('currentUser');
    final List<String>? currentUserAttributes =
        prefs.getStringList('currentUserAttributes');

    return UserData(
        addres: currentUser![0],
        attributes: currentUserAttributes!,
        authId: currentUser[1],
        birth: currentUser[2],
        city: currentUser[3],
        name: currentUser[4],
        phone: currentUser[5]);
  }
}
