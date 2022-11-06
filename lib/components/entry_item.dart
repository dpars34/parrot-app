import 'package:flutter/material.dart';

class EntryItem extends StatefulWidget {
  const EntryItem({Key? key, required this.item}) : super(key: key);

  final Map item;

  @override
  State<EntryItem> createState() => _EntryItemState();
}

class _EntryItemState extends State<EntryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            widget.item['data']['phrase'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          )
        ],
      ),
    );
  }
}
