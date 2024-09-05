import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FingerprintAuthScreen(),
    );
  }
}

class FingerprintAuthScreen extends StatefulWidget {
  @override
  _FingerprintAuthScreenState createState() => _FingerprintAuthScreenState();
}

class _FingerprintAuthScreenState extends State<FingerprintAuthScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });

      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      setState(() {
        _isAuthenticating = false;
        _authorized = authenticated ? 'Authorized' : 'Not Authorized';
      });

      if (authenticated) {
        // Generate a unique hash
        String hash = generateFingerprintHash();

        // Store the hash in Firebase Firestore
        await storeHashInFirestore(hash);
      }
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
    }
  }

  String generateFingerprintHash() {
    // Here, we are simulating a fingerprint data
    // In a real scenario, use actual fingerprint data
    String fingerprintData = "SampleFingerprintData";
    var bytes = utf8.encode(fingerprintData); // Convert data to bytes
    var digest = sha256.convert(bytes); // Generate SHA-256 hash
    return digest.toString(); // Return hash as a string
  }

  Future<void> storeHashInFirestore(String hash) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('fingerprint_hashes').add({
      'hash': hash,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fingerprint Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current State: $_authorized\n'),
            if (_isAuthenticating)
              ElevatedButton(
                onPressed: () async {
                  await auth.stopAuthentication();
                  setState(() => _isAuthenticating = false);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Cancel Authentication'),
                    Icon(Icons.cancel),
                  ],
                ),
              )
            else
              ElevatedButton(
                onPressed: _authenticate,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Authenticate with Fingerprint'),
                    Icon(Icons.fingerprint),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
