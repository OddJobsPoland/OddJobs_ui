class UserData {
  UserData(
      {required this.addres,
      required this.attributes,
      required this.authId,
      required this.birth,
      required this.city,
      required this.name,
      required this.phone});

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

  final String addres;
  final List<String> attributes;
  String authId;
  final String birth;
  final String city;
  String name;
  String phone;

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
        birth: '',
        city: '',
        name: '',
        phone: '');
  }

  static UserData persistentUserData = emptyUserData();
}
