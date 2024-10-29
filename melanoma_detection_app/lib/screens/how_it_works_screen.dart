import 'package:flutter/material.dart';
import '../drawer_menu.dart';

class HowItWorksScreen extends StatelessWidget {
  final String account;

  const HowItWorksScreen({super.key, required this.account});
  //quick generated rundown of how app works, no interesting comments to be made
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How It Works'),
      ),
      drawer: DrawerMenu(account: account),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'How Machine Learning and Image Classification Works',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Machine Learning (ML) is a field of artificial intelligence that uses statistical techniques to give computer systems the ability to "learn" from data, without being explicitly programmed. Image classification is a process in which a computer system can recognize and categorize objects within an image.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'In this app, we use a machine learning model to analyze images of skin lesions and predict whether they are benign or malignant. The model has been trained on a large dataset of labeled images, allowing it to learn the features that distinguish different types of lesions.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'When you upload an image, the model processes it and outputs a prediction along with a confidence score. This helps you understand the likelihood that the lesion is cancerous.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}