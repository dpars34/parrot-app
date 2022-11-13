import 'package:flutter/material.dart';

class RecordButton extends StatefulWidget {
  const RecordButton({Key? key, required this.isRecording, required this.callback}) : super(key: key);

  final bool isRecording;
  final VoidCallback callback;

  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: widget.isRecording ? Colors.red : Colors.blueGrey,
        shape: BoxShape.circle,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(1000.0),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(
            widget.isRecording ? Icons.square : Icons.mic,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
