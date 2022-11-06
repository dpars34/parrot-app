import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:parrot_app/components/search_item.dart';
import 'package:parrot_app/screens/detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  static const String route = '';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List items = [];
  final myController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  void handleSearch() async {
    items = [];
    print(myController.text);
    if (myController.text == '') {
      await db.collection("words").get().then((event) {
        for (var doc in event.docs) {
          setState(() {
            items.add({"id": doc.id, "data": doc.data()});
          });
        }
      });
    } else {
      await db.collection("words").where("word", isEqualTo: myController.text).get().then((event) {
        for (var doc in event.docs) {
          setState(() {
            items.add({"id": doc.id, "data": doc.data()});
          });
        }
      });
    }
  }

  void onResultClick(Map item) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(title: '詳細', item: item),
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parrot App'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(controller: myController),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: items.map((item) => SearchItem(item: item, callback: (val) => onResultClick(val),)).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleSearch,
        tooltip: 'Increment',
        child: const Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
