# Mobile Systems Development<br>COMP826<br><br><i>Prototype, Evaluation and Recommendations</i>

## Melanoma-detection App Repo for Android & IOS


![til](./figures/melanoma-app-ex.gif)

## Contents
  - Overview
  - Project Structure
  - Setup Instructions
    - Prerequisites
    - Installation
  - Usage
  - Main File Overview
  - Assets
  - Dependencies

## Overview

The Melanoma Detection App is a Flutter-based mobile application designed to help users detect melanoma from images. The app uses machine learning models to analyze images and provide predictions on the likelihood of melanoma. The project is assignment work for a hand-in and should not be used in any decision making regarding health.

## Project Structure

The main coding files are in the `/lib` folder of the project. The other files are for letting the app run on different emulators and devices, and have not been changed to a major degree
  - A notable exception to this is in the `./pubspec.yaml` file, which specifies importatn aspects of the app such as imports, and `build.gradle` files in the `android` subdirectories to customize versioning.

## Setup Instructions

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- Android Studio or Xcode: For running on Android or iOS devices/emulators

### Installation
<ol>
  <li> <b>Clone the repository</b>:<br>
        <code>sh git clone https://github.com/yourusername/melanoma_detection_app.git </code><br>
        <code> cd melanoma_detection_app</code>
  </li>
  
  <li> <b>Install dependencies</b>:<br>
        <code>flutter pub get</code>
  </li>
   
  <li>
    <b>Run the app</b>:<br>
        <code>flutter run</code>
  </li>
</ol>


## Usage
<ul>
  <li>Login: Select an account to log in.</li>
  <li>Upload Image: Choose an image from your gallery to analyze.</li>
  <li>View Results: See the prediction results and confidence levels.</li>
  <li>History: Access the history of your previous predictions.</li>
  <li>Learn More: Explore the "How It Works" and "Tutorial" sections for more information.</li>
</ul>


## Main File Overview
  - **lib/main.dart**: Entry point of the application.
  - **lib/screens/**: Contains all the screen widgets.
    - `accounts.dart`: Login screen.
    - `homeScreen.dart`: Home screen for uploading images.
    - `ml_screen.dart`: Screen for displaying the prediction process.
    - `results_screen.dart`: Screen for displaying prediction results.
    - `history_screen.dart`: Screen for viewing prediction history.
    - `how_it_works_screen.dart`: Information on how the app works.
    - `tutorial_screen.dart`: Tutorial for using the app.
    - `about_team_screen.dart`: Information about the development team.
    - `contact_screen.dart`: Contact information.
  - **lib/providers/**: Contains state management classes.
    - `account_provider.dart`: Manages account-related state.
  - **lib/models/**: Contains data models.
    - `prediction.dart`: Data model for predictions.
  - **lib/drawer_menu.dart**: Navigation drawer widget.

## Assets
  - `assets/images/`: Contains images used in the app.
  - `assets/readme.md`: Information about the model used for predictions.
  
## Dependencies
  - `flutter`: SDK for building the app.
  - `provider`: State management.
  - `path_provider`: Accessing file system paths.


