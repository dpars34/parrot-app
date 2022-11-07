import 'package:flutter/material.dart';

class UploadRecordScreen extends StatefulWidget {
  const UploadRecordScreen({Key? key}) : super(key: key);

  @override
  State<UploadRecordScreen> createState() => _UploadRecordScreenState();
}

class _UploadRecordScreenState extends State<UploadRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parrot App'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Ink(
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(1000.0),
                onTap: () {},
                child: const Padding(
                  padding:EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.mic,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
