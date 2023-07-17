class User{
  late final String email;
  late final String password;
  late final String nom;

  User({
    required this.email,
    required this.nom,
    required this.password
});
  Map<String,dynamic>toJson(){
    return{
      'email':email,
      'nom':nom,
      'password':password,
    };
  }

}