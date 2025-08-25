import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesCubit extends Cubit<List<Map<String, dynamic>>> {
  FavoritesCubit() : super([]);

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String get _uid => _auth.currentUser?.uid ?? '';

  bool isFavorite(String id) {
    return state.any((item) => item['id'] == id);
  }

  Future<void> loadFavorites() async {
    if (_uid.isEmpty) return;
    final snapshot = await _firestore
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .get();

    final favs = snapshot.docs.map((doc) => doc.data()).toList();
    emit(favs);
  }

  Future<void> toggleFavorite(Map<String, dynamic> item) async {
    if (_uid.isEmpty) return;

    final favRef = _firestore
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .doc(item['id']);

    if (isFavorite(item['id'])) {
      await favRef.delete();
      emit(state.where((element) => element['id'] != item['id']).toList());
    } else {
      await favRef.set(item);
      emit([...state, item]);
    }
  }

  List<Map<String, dynamic>> get favorites => state;
}

