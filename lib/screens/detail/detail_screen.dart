import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.title}) : super(key: key);

  static const String route = '/detail';
  final String title;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Map data = {};
  List details = [];

  FirebaseFirestore db = FirebaseFirestore.instance;

  void fetchData() async {
    await db.collection("entries").where("related_word", isEqualTo: data['item']['id']).get().then((event) {
      print(event.docs);
      // for (var doc in event.docs) {
      //   setState(() {
      //     items.add({"id": doc.id, "data": doc.data()});
      //   });
      // }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments != null ? ModalRoute.of(context)?.settings.arguments as Map : {};

    return Scaffold(
      appBar: AppBar(
        title: Text('Parrot App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['item']['data']['word'],
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  data['item']['data']['english'][0],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
