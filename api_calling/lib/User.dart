class User
{

  User({required this.id, required this.name, required this.email});

  final int id;
  final String name;
  final String email;

  // to construct a user object from a json map
  factory User.fromJson(Map<String, Object?> map)
  {
    return User(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String
    );
  }

}