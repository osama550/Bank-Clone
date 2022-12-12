class HomeModel {
  List<HomeModelData>? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HomeModelData>[];
      json['data'].forEach((v) {
        data!.add(HomeModelData.fromJson(v));
      });
    }
  }
}
class HomeModelData {
  int? id;
  String? type;
  int? amount;
  HomeModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    amount = json['amount'];
  }
}
