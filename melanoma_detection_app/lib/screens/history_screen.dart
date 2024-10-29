import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../drawer_menu.dart';
import 'dart:io';
import 'prediction_details_screen.dart';
import 'homeScreen.dart';
import '../providers/account_provider.dart';

class HistoryScreen extends StatelessWidget {
  final String account; //using work-around for accounts

  const HistoryScreen({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    // ensure the account is set before fetching history
    Provider.of<AccountProvider>(context, listen: false).setAccount(account);
    final history = Provider.of<AccountProvider>(context).history;
    print('Displaying history for account: $account');
    print('History: $history');

    return Scaffold(
      appBar: AppBar(
        title: Text('History for $account'),
      ),
      drawer: DrawerMenu(account: account),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil( //go to homescreen
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(account: account),
                  ),
                  (route) => false,
                );
              },
              child: Text('Back to Home Screen'),
            ),
          ),
          Expanded(
            child: history.isEmpty //if no runs available for account
                ? Center(child: Text('No runs available for this account.'))
                : ListView.builder(
                    itemCount: history.length, 
                    itemBuilder: (context, index) { //Building history items
                      final run = history[index];
                      return ListTile( //mostly just UI formatting
                        leading: run["imagePath"] != null
                            ? Image.file(File(run["imagePath"]))
                            : null,
                        title: Text(
                          'Run ${index + 1}: Label: ${run["label"]}, Confidence: ${run["confidence"]}',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push( //look at history of single prediction
                            context,
                            MaterialPageRoute(
                              builder: (context) => PredictionDetailsScreen(prediction: run),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}