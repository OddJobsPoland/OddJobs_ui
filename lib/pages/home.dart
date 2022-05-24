import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:jobs_ui/helpers/filters.dart';
import 'package:jobs_ui/helpers/offerCard.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../helpers/OfferData.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 75.0,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            " Oferty",
            style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w900),
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 2.0),
                child: IconButton(
                    onPressed: () {
                      showBarModalBottomSheet(
                          context: context,
                          builder: (context) => Filters(),
                          topControl: SizedBox(
                            height: 130,
                          ));
                    },
                    icon: Icon(
                      Icons.filter_alt,
                      color: Colors.black.withOpacity(0.85),
                      size: 30.0,
                    ))),
            Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.black.withOpacity(0.85),
                      size: 30.0,
                    )))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: FirestoreQueryBuilder<OfferData>(
              pageSize: 10,
              query: FirebaseFirestore.instance
                  .collection('Offers')
                  .orderBy('CreatedAt', descending: true)
                  .withConverter<OfferData>(
                      fromFirestore: ((snapshot, options) =>
                          OfferData.fromJson(snapshot.data()!)),
                      toFirestore: (value, options) => value.toJson()),
              builder: (context, snapshot, _) {
                if (snapshot.isFetching) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Błąd'),
                  );
                } else if (snapshot.docs.isEmpty) {
                  return Center(
                    child: Text('Brak ofert'),
                  );
                } else {
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        final hasReachEnd = snapshot.hasMore &&
                            index + 1 == snapshot.docs.length &&
                            !snapshot.isFetchingMore;

                        if (hasReachEnd) {
                          Future.delayed(Duration(milliseconds: 2000), () {
                            snapshot.fetchMore();
                          });
                        }
                        final post = snapshot.docs[index].data();
                        return OfferCard(
                          post.image,
                          post.firma,
                          post.stanowisko,
                          post.typ,
                          post.kasa,
                          post.CreatedAt,
                          post.offerDescription,
                          post.miasto,
                          post.umowa,
                        );
                      },
                      itemCount: snapshot.docs.length);
                }
              },
            )));
  }
}
