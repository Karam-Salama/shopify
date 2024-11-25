class UserCreationRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? password;


  UserCreationRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
