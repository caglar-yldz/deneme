import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String text;

  const ResultPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Okunan Veriler'),
        ),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: Text(text),
        ),
      );
}
