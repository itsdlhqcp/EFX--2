import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../../controllers/auth_controller.dart';

// Firebase Auth

final firebaseAuth = FirebaseAuth.instance;

// Cloud Firestore

final fireStore = FirebaseFirestore.instance;

// Firebase Storage

final storage = FirebaseStorage.instance;

// Auth Controller
final authController = AuthController();

Color kFillColor = Colors.white;
