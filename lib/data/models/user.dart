class User {
  String uid;
  String photoProfil;


  User(this.uid, this.photoProfil);

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'photoProfil': photoProfil,
  };
}