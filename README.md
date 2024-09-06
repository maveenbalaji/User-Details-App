# User Details App

**Overview**

The User Details App is a Flutter application designed to allow users to input their personal details such as name, age, state, and occupation. These details are then uploaded and stored in Google Firebase. Additionally, the app supports updating existing user information in the Firebase database. Despite the current issue of data not updating in the database, the app aims to provide a simple interface for user data management.

## Features

- **User Detail Input**: Users can input their name, age, state, and occupation.
- **Firebase Integration**: User data is uploaded and stored in Google Firebase for persistence.
- **Update Functionality**: Users can update their previously stored details in Firebase.
- **Real-time Database**: Firebase offers real-time data synchronization.

## Tech Stack

- **Flutter**: Used for building the cross-platform mobile app.
- **Dart**: Programming language used for Flutter development.
- **Google Firebase**: Backend for data storage and real-time database.
- **firebase_core & cloud_firestore**: Firebase packages integrated into the app for managing the database.

## How It Works

1. **Input User Details**: Users enter their name, age, state, and occupation through the app interface.
2. **Upload to Firebase**: The app uploads the data to a Firebase Firestore database.
3. **Update Data**: Users can edit their details, and the app is designed to update the existing data in Firebase.
4. **Real-time Sync**: Firebase syncs data in real time, reflecting changes instantly in the database (though an issue currently exists with data not updating properly).

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/maveenbalaji/User-Details-App.git
   ```

2. Navigate to the project directory:
   ```bash
   cd user-details-app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Set up Firebase:
   - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
   - Add the Firebase configuration files (`google-services.json` for Android or `GoogleService-Info.plist` for iOS) to your Flutter project.
   - Enable Firestore in your Firebase project.

5. Run the app:
   ```bash
   flutter run
   ```

## Firebase Configuration

1. **Firestore Database Setup**: In Firebase, create a Firestore database and configure read and write rules to allow the app to access the database.
2. **Upload User Data**: Ensure the app is connected to Firebase with the correct project credentials.
3. **Enable Read/Write Operations**: Ensure permissions for read and write operations are correctly set in Firestore security rules.

## Current Issue: Data Not Updating in Firebase

- **Problem**: The user details are being uploaded correctly to Firebase, but the data is not updating when a user tries to modify existing information.
- **Troubleshooting**: 
   - Ensure that the `document ID` is used correctly when updating data.
   - Check Firebase security rules to ensure the app has permission to perform update operations.
   - Verify that the code logic correctly references existing records in Firebase.

## Future Improvements

- **Data Update Fix**: Resolve the issue where user data does not update in Firebase.
- **User Authentication**: Add user authentication for secure access to personal information.
- **Enhanced UI/UX**: Improve the design of the app for a more seamless user experience.

![Screenshot (53)](https://github.com/user-attachments/assets/2c15242b-908e-4867-a0e5-31f666680b79)

![Screenshot (55)](https://github.com/user-attachments/assets/66a233f4-6f85-444d-b505-3c6509dc667b)

