class OffersList {
  OffersList({
    required this.offers,
  });

  final List<OfferData> offers;

  factory OffersList.fromJson(List<dynamic> parsedJson) {
    List<OfferData> offers = List<OfferData>.empty(growable: true);
    offers = parsedJson.map((i) => OfferData.fromJson(i)).toList();

    return new OffersList(offers: offers);
  }
}

class OfferData {
  OfferData(
      {required this.image,
      required this.firma,
      required this.stanowisko,
      required this.typ,
      required this.kasa,
      required this.CreatedAt,
      required this.miasto,
      required this.umowa});

  final String image;
  final String firma;
  final String stanowisko;
  final String typ;
  final String kasa;
  final String CreatedAt;
  final String miasto;
  final String umowa;

  factory OfferData.fromJson(Map<String, Object?> json) {
    return new OfferData(
      image: json['image'].toString(),
      firma: json['firma'].toString(),
      stanowisko: json['stanowisko'].toString(),
      typ: json['typ'].toString(),
      kasa: json['kasa'].toString(),
      CreatedAt: json['CreatedAt'].toString(),
      miasto: json['miasto'].toString(),
      umowa: json['umowa'].toString(),
    );
  }
}
