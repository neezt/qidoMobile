class Usuario {
  final int id;
  final String name;
  final String email;
  final String token;

  Usuario(this.id, this.name, this.email, this.token);

  Usuario.fromMap(Map<String, dynamic> item):
        id=item["id"], name= item["name"], email= item["email"], token= item["token"];

  Map<String, Object> toMap(){
    return {'id':id,'name': name,'email': email,'token': token};
  }

}