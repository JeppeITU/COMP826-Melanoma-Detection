import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'screens/accounts.dart';
import 'providers/account_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //bindings should be initialized before runApp() is called
  await _copyAssetsToStorage(); //images to external storage workaround
  runApp(
    MultiProvider(
      providers: [ //provider for AccountProvider --> account workaround
        ChangeNotifierProvider(create: (_) => AccountProvider()),
      ],
      child: MyApp(),
    ),
  );
}

Future<void> _copyAssetsToStorage() async { //images to external storage workaround
  final imagePaths = [
    'assets/images/melanoma_0.jpg',
    'assets/images/melanoma_1.jpg',
    'assets/images/melanoma_2.jpg',
    'assets/images/melanoma_3.jpg',
    'assets/images/melanoma_4.jpg',
    'assets/images/melanoma_5.jpg',
    'assets/images/melanoma_6.jpg',
    'assets/images/melanoma_7.jpg',
    'assets/images/melanoma_8.jpg'
  ];

  final directory = await getExternalStorageDirectory();
  if (directory != null) {
    for (final path in imagePaths) {
      final byteData = await rootBundle.load(path);
      final file = File('${directory.path}/${path.split('/').last}'); //Creates file in external storage
      await file.writeAsBytes(byteData.buffer.asUint8List()); //Writes image to file
    }
  }
}
//Main app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melanoma Detection App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(), //Initial screen of app
    );
  }
}