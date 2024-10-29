import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:provider/provider.dart';
import 'results_screen.dart';
import '../providers/account_provider.dart';

// screen only to show the prediction process
class PredictionScreen extends StatefulWidget {
  final File image;
  final String account;

  const PredictionScreen({super.key, required this.image, required this.account});

  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  bool _loading = true; 
  bool _localModelDone = false;
  bool _onlineModelDone = false;
  String _statusTextLocal = "Predicting on local model...";
  String _statusTextOnline = "Predicting on online model...";

  @override
  void initState() {
    super.initState();
    // need the account to be set before adding predictions
    WidgetsBinding.instance.addPostFrameCallback((_) { //GPT error-handling to ensure account is set
    Provider.of<AccountProvider>(context, listen: false).setAccount(widget.account);
    _predictImage(widget.image, isLocalModel: true); //predict w. local model
  });
  }

  //func to predict on image --> workaround for prediction, random prediction
  Future<void> _predictImage(File image, {required bool isLocalModel}) async {
    try {
      print('Starting image prediction...');
      var random = Random(); //random prediction
      var delayDuration = isLocalModel //simulated delay
          ? Duration(milliseconds: (random.nextDouble() * 900 + 100).toInt())
          : Duration(milliseconds: (random.nextDouble() * 1000 + 2000).toInt());

      await Future.delayed(delayDuration);

      // output based on prediction
      var confidence = random.nextDouble();
      var label = confidence <= 0.5 ? "0" : "1";
      var output = {
        "label": label,
        "confidence": confidence,
        "imagePath": image.path
      };
      print('Prediction output: $output');

      if (isLocalModel && label == "1") {
        setState(() {
          _localModelDone = true;
        });
        setState(() { //only running online model if local model predicts melanoma
          _statusTextOnline = "Predicting on online model...";
        });
        await _predictImage(image, isLocalModel: false);
      } else { //otherwise predictions are done
        setState(() {
          if (isLocalModel) {
            _localModelDone = true;
          } else {
            _onlineModelDone = true;
          }
        });
        await Future.delayed(Duration(seconds: 1)); // a dd a small delay to show the checkmark before changing screens

        // save the final prediction to the account's history
        print('Saving prediction to history for account: ${widget.account}');
        Provider.of<AccountProvider>(context, listen: false).addPrediction(widget.account, output);
        print('History after saving: ${Provider.of<AccountProvider>(context, listen: false).allHistory}');
        setState(() {
          _loading = false;
        });
        Future.delayed(Duration.zero, () { //navigate to results screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsScreen(results: [output], account: widget.account),
            ),
          );
        });
      }
    } catch (e) {
      print('Error predicting image: $e'); //error handling --> mostly applicable when model goes online
    }
  }

  @override //UI showing prediction process and checkmarks
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Screen'),
      ),
      body: _loading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_statusTextLocal),
                      if (_localModelDone) Icon(Icons.check, color: Colors.green),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(_statusTextOnline),
                      if (_onlineModelDone) Icon(Icons.check, color: Colors.green),
                    ],
                  ),
                ],
              ),
            )
          : Container(), // empty container as the results are shown in ResultsScreen
    );
  }
}