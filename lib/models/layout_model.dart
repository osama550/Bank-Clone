class LayoutModel {
  String? clientName;
  String? clientPhoto;
  String? totalBalance;
  List<LayoutDataModel> clientAccounts = [];

  LayoutModel.fromJson(Map<dynamic, dynamic> json) {
    clientName = json['Client_Name'];
    clientPhoto = json['Client_Photo'];
    totalBalance = json['Total_Balance'];

    if (json['Client_Accounts'] != null) {
      json['Client_Accounts'].forEach((item) {
        clientAccounts.add(LayoutDataModel.fromJson(item));
      });
    }
  }
}

class LayoutDataModel {
  String? accountId;
  String? accountType;
  String? accountBalance;

  LayoutDataModel.fromJson(Map<dynamic, dynamic> json) {
    accountId = json['Account_id'];
    accountType = json['Account_Type'];
    accountBalance = json['Account_Balance'];
  }
}
