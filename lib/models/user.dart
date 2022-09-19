class User {
  final String uid;
  final String email;
  final String username;
  final String phoneNumber;

  User({
    required this.uid,
    required this.email,
    required this.username,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}
