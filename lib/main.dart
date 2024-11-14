import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopify/firebase_options.dart';
import 'app/shopify_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Shopify());
}


