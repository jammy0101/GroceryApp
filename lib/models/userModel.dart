
class UserModel {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  int? phoneNumber;
  String? gender;
  String? id;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.phoneNumber,
    this.gender,
    this.id,
  });

  // Convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword' : confirmPassword,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'id' : id,
    };
  }

  // Create a User object from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      confirmPassword : json['confirmPassword'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      id : json['id'],
    );
  }

  // Convert a list of JSON maps to a list of User objects
  static List<UserModel> jsonListToClassList(List<dynamic> jsonList) {
    return jsonList.map((json) => UserModel.fromJson(json)).toList();
  }

  // Convert a list of User objects to a list of JSON maps
  static List<Map<String, dynamic>> classListToJsonList(List<UserModel> users) {
    return users.map((user) => user.toJson()).toList();
  }

  // Copy a User object with updated fields
  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    int? phoneNumber,
    String? gender,
    String? id,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword : confirmPassword ?? this.confirmPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'User(name: $name, email: $email, password: $password, phoneNumber: $phoneNumber, gender: $gender,id : $id,confirmPassword : $confirmPassword)';
  }
}
