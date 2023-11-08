class CommonModel {
  bool? status;
  String? msg;
  String? token;

  CommonModel({this.status, this.msg,this.token});

  CommonModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];

     token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['token'] = token;
    return data;
  }
}
