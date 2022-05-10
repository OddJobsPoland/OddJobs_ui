import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:jobs_ui/pages/offer.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OfferCard extends StatelessWidget {
  OfferCard(
    this.image,
    this.firma,
    this.stanowisko,
    this.typ,
    this.kasa,
    this.CreatedAt,
    this.miasto,
    this.umowa, {
    Key? key,
  }) : super(key: key);

  final Timestamp CreatedAt;
  final String image, firma, stanowisko, typ, kasa, miasto, umowa;
  late String ago;
  @override
  Widget build(BuildContext context) {
    ago = Jiffy(DateTime.parse(CreatedAt.toDate().toString()), "yyyy-MM-dd")
        .fromNow();
    Jiffy.locale("pl");
    return GestureDetector(
        onTap: () => pushNewScreen(
              context,
              screen: Offer(image, firma, stanowisko, typ, kasa, CreatedAt,
                  miasto, umowa),
              withNavBar: true, // OPTIONAL VALUE. True by default.
            ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.network(image, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$firma | $ago",
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: Text(
                          stanowisko,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.15),
                        ),
                      ),
                      //Money
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.money_dollar_circle,
                                size: 16,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Flexible(
                                child: Text(
                                  kasa,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      //Adress
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            size: 16,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Flexible(
                            child: Text(
                              miasto,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      //Contract
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.assignment_outlined,
                              size: 16,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Flexible(
                              child: Text(
                                umowa,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ])
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 18),
          ],
        ));
  }
}
