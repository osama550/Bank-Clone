// class AllTransferModel{
//   String? transferTo;
//   int? id;
//   String? type;
//   bool? favorite;
//
//   AllTransferModel.fromJson(Map<String, dynamic> json){
//     json['Transfer_to'] = transferTo;
//     json['id'] = id;
//     json['Type'] = type;
//     json['Favourit'] = favorite;
//   }
//
// }



class TransferUsersModel {
  String? transferTo;
  String? id;
  String? type;
  bool? favourit;


  TransferUsersModel.fromJson(Map<String, dynamic> json) {
    transferTo = json['Transfer_To'];
    id = json['id'];
    type = json['Type'];
    favourit = json['Favourit'];
  }

}