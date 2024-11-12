class UserForm {
  int? id;
  String name;
  String gender;
  int age;

  UserForm ({this.id, required this.name, required this.gender, required this.age});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'age': age,
    };
  }
}
