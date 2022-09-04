// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../../Utils/utils.dart';

// class GetUsers {
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

//   List<Map<String, dynamic>>? usersData;
//   Utils utils = Utils();
//   Future getUsers() async {
//     try {
//       await users.get().then((value) {
//         print(value);
//         print('Mehdi');
//       });
//     } on FirebaseException catch (e) {
//       print(e.message);
//     }
//   }
// }
