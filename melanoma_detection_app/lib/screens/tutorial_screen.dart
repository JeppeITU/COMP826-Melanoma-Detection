import 'package:flutter/material.dart';
import '../drawer_menu.dart';

//filler screen with list/tutorial of how app works
class TutorialScreen extends StatelessWidget {
  final String account;

  const TutorialScreen({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial for App'),
      ),
      drawer: DrawerMenu(account: account),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'How to Use the App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                '1. Login: Select your account to log in.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                '2. Take or Choose a Picture: Use the "Take Picture" button to capture a new image or the "Choose Picture" button to select an existing image from your gallery.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                '3. Predict Image: After selecting an image, click the "Predict Image" button to analyze the image using our machine learning model.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                '4. View Results: The app will display the prediction results, indicating whether the lesion is likely benign or malignant.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                '5. See History: You can view the history of your predictions by navigating to the "History" screen from the menu.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}