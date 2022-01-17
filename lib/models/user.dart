import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List follower;
  final List following;

  const Users(
      {required this.username,
      required this.uid,
      required this.photoUrl,
      required this.email,
      required this.bio,
      required this.follower,
      required this.following});

  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Users(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      bio: snapshot["bio"],
      follower: snapshot["follower"],
      following: snapshot["following"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "bio": bio,
        "follower": follower,
        "following": following,
      };
}
