import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jalviks/models/info.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({ this.uid});

  final CollectionReference userInfoCollection =
      FirebaseFirestore.instance.collection('user_info');

  Future updateUserData(String name, String contact, String city) async {
    return await userInfoCollection.doc(uid).set({
      'id': uid,
      'name': name,
      'contact': contact,
      'city': city,
    });
  }

  List<Informaiton> _infoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Informaiton(
        uid: doc.get('id') ?? '',
        name: doc.get('name') ?? '',
        phone: doc.get('contact') ?? '',
        city: doc.get('city') ?? '',
      );
    }).toList();
  }

  Stream<List<Informaiton>> get info {
    return userInfoCollection.snapshots().map(_infoListFromSnapshot);
      
  }
}
