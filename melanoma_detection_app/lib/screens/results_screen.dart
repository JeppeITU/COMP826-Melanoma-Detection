import '../drawer_menu.dart';
import 'homeScreen.dart';
import 'history_screen.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> results; //prediction results (list = predictions from both models)
  final String account;

  const ResultsScreen({super.key, required this.results, required this.account});

  @override
  Widget build(BuildContext context) {
    // determine title and color based on prediction results
    String titleText;
    Color titleBackgroundColor;
    // low < 0.5 <= possible < 0.75 <= high
    if (results.any((result) => result["label"] == "1" && result["confidence"] >= 0.75)) {
      titleText = "HIGH RISK OF MELANOMA";
      titleBackgroundColor = Colors.red;
    } else if (results.any((result) => result["label"] == "1" && result["confidence"] >= 0.5)) {
      titleText = "POSSIBILITY OF MELANOMA";
      titleBackgroundColor = Colors.orange;
    } else {
      titleText = "LOW RISK OF MELANOMA";
      titleBackgroundColor = Colors.green;
    }

    return Scaffold( //formatting of screen
      appBar: AppBar(
        title: Text('Results Screen'),
      ),
      drawer: DrawerMenu(account: account),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: titleBackgroundColor,
              padding: const EdgeInsets.all(8.0),
              child: Text(
                titleText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'What Happens Next?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
              "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
              "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil( //weird implementation to not return to ml_screen but homeScreen
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(account: account),
                      ),
                      (route) => false,
                    );
                  },
                  child: Text('Back to Image Picker'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HistoryScreen(account: account), //go to account history
                      ),
                    );
                  },
                  child: Text('See History'),
                ),
              ],
            ),
            const SizedBox(height: 20), //showing label and confidence of prediction, should probably be gone for "commercial release"
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Label: ${results[index]["label"]}, Confidence: ${results[index]["confidence"]}',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}