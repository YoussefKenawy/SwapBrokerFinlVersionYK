import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('posts5')
        .where('searchKey',
        isEqualTo: searchField.substring(0, 1))
        .getDocuments();
  }
}


