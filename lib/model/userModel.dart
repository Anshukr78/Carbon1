
class UserModel{

  UserModel({
    required this.id,
    required this.photoUrl,
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.gender,
    required this.mobile,
    required this.location,
    required this.lan,
    required this.long,
    required this.dob,
    required this.city,
    required this.countryName,
    required this.pin_code,
    required this.reward_point,
    required this.carbonFootPrint,
});

  late String id;
  late String photoUrl;
  late String first_name;
  late String last_name;
  late String email;
  late String gender;
  late String mobile;
  late String location;
  late String lan;
  late String long;
  late String dob;
  late String city;
  late String countryName;
  late String pin_code;
  late String reward_point;
  late String carbonFootPrint;


  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    photoUrl = json['photoUrl'] ?? '';
    first_name = json['first_name'] ?? '';
    last_name = json['last_name'] ?? '';
    gender = json['gender'] ?? '';
    mobile = json['mobile'] ?? '';
    location = json['location'] ?? '';
    email = json['email'] ?? '';
    lan = json['lan'] ?? '';
    long = json['long'] ?? '';
    dob = json['dob'] ?? '';
    city = json['city'] ?? '';
    countryName = json['countryName'] ?? '';
    pin_code = json['pin_code'] ?? '';
    reward_point = json['reward_point'] ?? '';
    carbonFootPrint = json['carbonFootPrint'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['photoUrl'] = photoUrl;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['id'] = id;
    data['location'] = location;
    data['email'] = email;
    data['carbonFootPrint'] = carbonFootPrint;
    data['reward_point'] = reward_point;
    data['pin_code'] = pin_code;
    data['countryName'] = countryName;
    data['city'] = city;
    data['dob'] = dob;
    data['long'] = long;
    data['lan'] = lan;
    return data;
  }


}