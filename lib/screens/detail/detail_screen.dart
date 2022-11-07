import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parrot_app/components/entry_item.dart';
import 'package:parrot_app/screens/upload/upload_record_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.title, required this.item}) : super(key: key);

  static const String route = '/detail';
  final String title;
  final Map item;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List entries = [];

  FirebaseFirestore db = FirebaseFirestore.instance;

  void fetchData() async {
    await db.collection("entries").where("related_word", isEqualTo: widget.item['id']).get().then((event) {
      for (var doc in event.docs) {
        setState(() {
          entries.add({"id": doc.id, "data": doc.data()});
        });
      }
      print(entries);
    });
  }

  void toUploadScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UploadRecordScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Parrot App'),
        actions: [
          TextButton(
            onPressed: toUploadScreen,
            child: const Text(
              "アプロード",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
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
                  widget.item['data']['word'],
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  widget.item['data']['english'][0],
                )
              ],
            ),
          ),
          Column(
            children: entries.map((entry) => EntryItem(item: entry)).toList()
          )
        ],
      ),
    );
  }
}
