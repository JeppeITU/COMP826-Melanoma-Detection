import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'ml_screen.dart';
import '../drawer_menu.dart';

class HomeScreen extends StatefulWidget {
  final String account;

  const HomeScreen({super.key, required this.account});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  final picker = ImagePicker();

  // camera functionality to take a picture
  Future<void> _takePicture() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);  // Store the captured image
      } else {
        print('No image selected.');
      }
    });
  }

  // function to choose a picture from the gallery --> hardcoded image paths
  Future<void> _choosePicture() async {
    final directory = await getExternalStorageDirectory();
    if (directory != null) {
      final imagePaths = [
        '${directory.path}/melanoma_0.jpg',
        '${directory.path}/melanoma_1.jpg',
        '${directory.path}/melanoma_2.jpg',
        '${directory.path}/melanoma_3.jpg',
        '${directory.path}/melanoma_4.jpg',
        '${directory.path}/melanoma_5.jpg',
        '${directory.path}/melanoma_6.jpg',
        '${directory.path}/melanoma_7.jpg',
        '${directory.path}/melanoma_8.jpg'
      ];

      showDialog( // dialog to choose image
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Choose Picture'),
            content: Container(
              width: double.maxFinite,
              height: 300, // fixed height for the GridView
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // cols in the grid
                  crossAxisSpacing: 4.0, // spacing between cols
                  mainAxisSpacing: 4.0, // spacing between rows
                ),
                itemCount: imagePaths.length, //len of imagepaths
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _image = File(imagePaths[index]); // store selected image
                      });
                      Navigator.pop(context); //pop used to close dialog
                    },
                    child: Image.file(File(imagePaths[index]), width: 100, height: 100), //displaying image
                  );
                },
              ),
            ),
          );
        },
      );
    }
  }

  // Function to navigate to the PredictionScreen
  void _predictImage() {
    if (_image != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PredictionScreen(image: _image!, account: widget.account),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen - ${widget.account}'),
      ),
      drawer: DrawerMenu(account: widget.account),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _takePicture,
              child: const Text('Take Picture'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _choosePicture,
              child: const Text('Choose Picture'),
            ),
            const SizedBox(height: 20),
            // sisplay selected image
            if (_image != null)
              Image.file(_image!)
            else
              const Text('No image selected.'),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _image != null ? _predictImage : null, // to ml_screen only if image is selected
              child: const Text('Predict Image'),
            ),
          ],
        ),
      ),
    );
  }
}