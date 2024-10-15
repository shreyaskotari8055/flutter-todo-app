class User {
  String userId ;
  String name ;
  String email ;
  bool isActive ;
  List<dynamic> favorites ;
  List<dynamic> deviceToken ;
  String createdAt ;
  String? updatedAt ;

  User(
      { this.userId = '',
       this.name = '',
       this.email = '',
       this.isActive = true,
       this.favorites = const [],
       this.deviceToken =const [],
       this.createdAt  = '',
      this.updatedAt});

  factory User.fromMap(Map<String, dynamic> json) => User(
      userId: json["userId"] as String,
      name: json["name"] as String,
      email: json["email"] as String,
      isActive: json["isActive"] as bool,
      deviceToken: (json["deviceToken"] as List<dynamic>?)!.map((e) => e as String).toList(),
      favorites: (json["favorites"] as List<dynamic>?)!.map((e) => e as String).toList(),
      createdAt: json["createdAt"] as String,
      updatedAt: json["updatedAt"] as String);

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'name': name,
        'email': email,
        'isActive': isActive,
        'deviceToken':deviceToken,
        'favorites' : favorites,
        'createdAt': createdAt,
        'updatedAt': updatedAt
      };
}
