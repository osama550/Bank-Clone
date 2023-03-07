class ElectricityModel{
  String? name;
  String? amount;
  String? status;

  ElectricityModel.fromJson(Map<String, dynamic> json){
    name = json['Name'];
    amount = json['Bill'];
    status = json['Status'];
  }
}