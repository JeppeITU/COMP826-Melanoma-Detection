import 'package:flutter/material.dart';

class AccountProvider with ChangeNotifier {
  String _account = '';
  Map<String, List<Map<String, dynamic>>> _history = {};

  String get account => _account; //getter for account

  List<Map<String, dynamic>> get history { //getter for history of account
    print('Fetching history for account: $_account');
    print('History map: $_history');
    return _history[_account] ?? [];
  }

  // Public getter for all _history mapping
  Map<String, List<Map<String, dynamic>>> get allHistory => _history;

  void setAccount(String account) { //setter for account
    print('Setting account: $account');
    _account = account;
    notifyListeners(); //update listeners
  }

  //add prediction to history of specific account
  void addPrediction(String account, Map<String, dynamic> prediction) {
    print('Adding prediction for account: $account');
    if (_history[account] == null) {
      _history[account] = []; //create new history if none exists
    }
    _history[account]!.add(prediction);
    print('Updated history for account $account: ${_history[account]}');
    notifyListeners(); //update listeners
  }

  //clear history of specific account
  void clearHistory(String account) {
    _history[account]?.clear();
    notifyListeners(); //update listeners
  }
}