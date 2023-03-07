class InternetModel{
  String? name;
  String? amount;
  String? status;

  InternetModel.fromJson(Map<String, dynamic> json){
    name = json['Name'];
    amount = json['Bill'];
    status = json['Status'];
  }

}