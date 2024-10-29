import 'package:flutter/material.dart';
import 'dart:io';

//show specific prediction details from history
class PredictionDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> prediction;

  const PredictionDetailsScreen({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), //padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (prediction["imagePath"] != null)
              Image.file(File(prediction["imagePath"])),
            const SizedBox(height: 20),
            Text(
              'Label: ${prediction["label"]}',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Confidence: ${prediction["confidence"]}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}