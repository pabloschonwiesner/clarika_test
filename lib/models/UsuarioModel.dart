class UsuarioModel {
  int id;
  String firstName;
  String lastName;
  String jobPosition;
  String gender;
  String location;
  String photo;

  UsuarioModel({this.id, this.firstName, this.lastName, this.jobPosition, this.gender, this.location, this.photo});

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
    id: json['id'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    jobPosition: json['job_position'],
    gender: json['gender'],
    location: json['location'],
    photo: json['photo'],
  );

}