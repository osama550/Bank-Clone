class WithdrawelModel {
  String? accountType;
  int? amount ;
  int? atm_id;
  int? transaction ;

  WithdrawelModel.fromJson(Map<dynamic, dynamic> json) {
    json['account_type'] = accountType;
    json['amount'] = amount;
    json['ATM_id'] = atm_id;
    json['transaction'] = transaction;
    // accountType = json['account_type'];
    // amount = json['amount'];
    // atm_id = json['ATM_id'];
    // transaction = json['transaction'];
  }
}