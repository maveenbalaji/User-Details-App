User Details App

Overview

The User Details App is a Flutter application designed to allow users to input their personal details such as name, age, state, and occupation. These details are then uploaded and stored in Google Firebase. 

Additionally, the app supports updating existing user information in the Firebase database. Despite the current issue of data not updating in the database, the app aims to provide a simple interface for user data 

management.

Features

User Detail Input: Users can input their name, age, state, and occupation.

Firebase Integration: User data is uploaded and stored in Google Firebase for persistence.

Update Functionality: Users can update their previously stored details in Firebase.

Real-time Database: Firebase offers real-time data synchronization.

Tech Stack

Flutter: Used for building the cross-platform mobile app.

Dart: Programming language used for Flutter development.

Google Firebase: Backend for data storage and real-time database.

firebase_core & cloud_firestore: Firebase packages integrated into the app for managing the database.

How It Works

Input User Details: Users enter their name, age, state, and occupation through the app interface.

Upload to Firebase: The app uploads the data to a Firebase Firestore database.

Update Data: Users can edit their details, and the app is designed to update the existing data in Firebase.

Real-time Sync: Firebase syncs data in real time, reflecting changes instantly in the database (though an issue currently exists with data not updating properly).
