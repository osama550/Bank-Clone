class LayoutModel {
  String? clientName;
  String? totalBalance;
  List<LayoutDataModel> clientAccounts = [];

  LayoutModel.fromJson(Map<dynamic, dynamic> json) {
    clientName = json['Client_Name'];
    totalBalance = json['Total_balance'];

    if (json['Client_accounts'] != null) {
      json['Client_accounts'].forEach((item) {
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
