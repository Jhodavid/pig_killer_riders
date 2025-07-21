import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  factory FirestoreService() => _instance;

  final FirebaseFirestore db = FirebaseFirestore.instance;

  FirestoreService._internal();
}