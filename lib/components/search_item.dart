import 'package:flutter/material.dart';

typedef MapCallback = void Function(Map val);

class SearchItem extends StatelessWidget {
  const SearchItem({Key? key, required this.item, required this.callback}) : super(key: key);

  final Map item;
  final MapCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => callback(item),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent,
        ),
        child: Text(
          item['data']['word'],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )
        ),
      ),
    );
  }
}
