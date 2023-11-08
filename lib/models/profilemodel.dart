class ProfileModel {
  bool? status;
  String? msg;
  Data? data;

  ProfileModel({this.status, this.msg, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? role;
  int? usertype;
  String? status;
  String? phone;
  String? name;
  String? email;
  String? password;
  String? createDate;
  String? updateDate;
  int? iV;

  Data(
      {this.sId,
      this.role,
      this.usertype,
      this.status,
      this.phone,
      this.name,
      this.email,
      this.password,
      this.createDate,
      this.updateDate,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    role = json['role'];
    usertype = json['usertype'];
    status = json['status'];
    phone = json['phone'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['role'] = role;
    data['usertype'] = usertype;
    data['status'] = status;
    data['phone'] = phone;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    data['__v'] = iV;
    return data;
  }
}
