class AllInfo {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String phone;
  final String birthDate;
  final String address;
  final String university;
  final String role;

  AllInfo({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.phone,
    required this.birthDate,
    required this.address,
    required this.university,
    required this.role,
  });

  factory AllInfo.fromJson(Map<String, dynamic> json) {
    return AllInfo(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
      phone: json['phone'],
      birthDate: json['birthDate'],
      address: json['address']['address'] + ', ' + json['address']['city'] + ', ' + json['address']['state'],
      university: json['university'],
      role: json['role'],
    );
  }
}