import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/models/layout_model.dart';
import 'package:project/models/withdrawel_model.dart';
import 'package:project/modules/in_out_payment/history.dart';
import 'package:project/modules/in_out_payment/requested.dart';
import 'package:project/modules/in_out_payment/scheduled.dart';
import 'package:project/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int billIndex = 0;

  List<Map> bills = [
    {
      'title' : 'Electricity',
      'image' : 'images/Picture2.png',
    },
    {
      'title' : 'Internet',
      'image' : 'images/Picture3.png',
    },
    {
      'title' : 'Water',
      'image' : 'images/Picture4.png',
    },
    {
      'title' : 'E-Wallet',
      'image' : 'images/Picture5.png',
    },
    {
      'title' : 'School Fees',
      'image' : 'images/Picture6.png',
    },
    {
      'title' : 'Gas',
      'image' : 'images/Picture7.png',
    },
    {
      'title' : 'Garbage',
      'image' : 'images/Picture8.png',
    },
    {
      'title' : 'Sanitation',
      'image' : 'images/Picture9.png',
    },
    {
      'title' : 'Phone',
      'image' : 'images/Picture10.png',
    },
    {
      'title' : 'Land Line',
      'image' : 'images/Picture11.png',
    },
    {
      'title' : 'Television',
      'image' : 'images/Picture12.png',
    },
    {
      'title' : 'Games',
      'image' : 'images/Picture13.png',
    },
  ];


  void selectBillScreen(int index){
    emit(ChangePaymentBillScreenState());
    billIndex = index;
  }


  List<Widget> inOutScreens = [
    HistoryScreen(),
    ScheduledScreen(),
    RequestedScreen(),
  ];

  int numberOfInOutScreen = 0;

  void selectInOutPayment({
  required int index,
}){
    emit(ChangeInOutPaymentScreenState());
    numberOfInOutScreen = index;
    print(numberOfInOutScreen);
  }


  // IconData favoriteIcon = Icons.star_border_rounded;
  // bool isFavorite = false;
  List isFavorite = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<IconData> favoriteIcon = [
    Icons.star_border_rounded,
    Icons.star_border_rounded,
    Icons.star_border_rounded,
    Icons.star_border_rounded,
    Icons.star_border_rounded,
    Icons.star_border_rounded,
    Icons.star_border_rounded,
    Icons.star_border_rounded,
    Icons.star_border_rounded,
    Icons.star_border_rounded,
    Icons.star_border_rounded,
  ];
  List favoriteColor = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];

  void changeFavoriteIcon({
  required int index,
}){
    isFavorite[index] = !isFavorite[index];
    if(isFavorite[index]){
      favoriteIcon[index] = Icons.star_rounded;
      favoriteColor[index] = Colors.amber;
    }
    else{
      favoriteIcon[index] = Icons.star_border_outlined;
      favoriteColor[index] = Colors.grey;
    }
    emit(ChangeFavoriteIconState());
  }



  // List images = ['images/Picture2.png','images/Picture3.png','images/Picture4.png','images/Picture5.png',
  //   'images/Picture6.png','images/Picture7.png','images/Picture8.png','images/Picture9.png',
  //   'images/Picture10.png','images/Picture11.png','images/Picture12.png','images/Picture13.png'];
  //
  // List titles = ['Electricity','Internet','Water','E-Wallet','School Fees', 'Gas', 'Garbage',
  //   'Sanitation', 'Phone', 'Land Line', 'Television', 'Games'];

void isBankAccountEmpty({
  required String text,
  required int id,
}){
    if(text.isEmpty){
      text = text;
    }
    else{
      text = text.substring(0, text.length-1);
    }
    emit(ChangeIsBankAccountEmptyState());

    switch(id){
      case 1:
        result = text;
        break;
      case 2:
        transferResult = text;
        break;
      case 3:
        addTransferRecipientResult = text;
        break;
      case 4:
        withdrawelResult = text;
        break;
    }

}
//-------------------------------------
  void isBankTransferEmpty({
    required String text,
  }){
    if(transferResult.isEmpty){
      transferResult= text;
    }
    else{
      transferResult = text.substring(0, text.length-1);
    }
    emit(AddTextToBankTransferState());
  }

//-------------------------------------------------

  var result ='';
  var transferResult = '';
  var addTransferRecipientResult = '';
  var withdrawelResult = '';
void addTextToBankAccount({
  required String num,
  required String amount,
  required int id,
}){
  if(amount.length == 0 && num == '0'){
    amount = amount;
  }
  else if(isMaxLength(text: amount)){
    amount = amount + num;
    print(amount);
  }
  else{
    amount = amount;
  }
    emit(AddTextToBankAccountState());
  switch(id){
    case 1:
      result = amount;
      break;
    case 2:
      transferResult = amount;
      break;
    case 3:
      addTransferRecipientResult = amount;
      break;
    case 4:
      withdrawelResult = amount;
      break;
  }
}

  String dropdownvalue = 'USD';
  late String newValue ;
  void dropDownValue(
    newValue
    ){
  dropdownvalue = newValue;
  emit(AddDropDownValueState());
}

//-------------------------------------------------

//  this function used to limit the amount of money that can transfer or payment.
bool isMaxLength({
  required String text,
}){
  return text.length <= 8? true : false;
}
//-------------------------------------------------

  void clearAmount({
    required int id,
  }){
    switch(id){
      case 1:
        result = '';
        break;
      case 2:
        transferResult = '';
        break;
      case 3:
        addTransferRecipientResult = '';
        break;
      case 4:
        withdrawelResult = '';
        break;
    }
  }

//-------------------------------------------------

  LayoutModel? layoutModel;
  String? data;
  void getLayoutData(){
    emit(GetLayoutLoadingState());
    DioHelper.getData(
      path: 'atm/home.php',
    ).then((value){
      // print(value.data.runtimeType);
      // print(value.data);
      // layoutModel = LayoutModel.fromJson(value.data);
      layoutModel = LayoutModel.fromJson(jsonDecode(value.data));
      // print(layoutModel!.totalBalance);
      print('Get Layout Data Successfully');
      emit(GetLayoutSuccessState());
    }).catchError((error){
      emit(GetLayoutErrorState());
      print('Error When Get Layout Data Data =====> ${error.toString()}');
    });
  }


  var userAccountIndex;
  void userAccount({
    required int index,
  }){
    emit(ChangeUserAccountState());
    userAccountIndex = index;
  }



//---------------------------------------------------

  late LocalAuthentication auth = LocalAuthentication();
  bool? canCheckBiometrics;
  List<BiometricType>? availableBiometrics;
  bool? isAuthenticating;
  String authorized = 'Not Authorized';
  int start = 30;

  Future<void> checkBiometrics() async {
    bool? CheckBiometrics;
    try {
      print('ok');
      CheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print('No No');
      CheckBiometrics = false;
      print(e);
    }
    canCheckBiometrics = CheckBiometrics;
  }

  Future<void> getAvailableBiometrics() async {
    List<BiometricType>? availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometric = <BiometricType>[];
      print(e);
    }
    availableBiometrics = availableBiometric;
  }


  Future<void> authenticate({
    required BuildContext context,
  }) async {
    emit(AuthenticateUserLoadingState());
    bool authenticated = false;
    try {
      isAuthenticating = true;
      authorized = 'Authenticating';
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
          biometricOnly: true,
        ),
      );
      BiometricType.fingerprint;
      BiometricType.fingerprint;
      isAuthenticating = false;
      emit(AuthenticateUserSuccessState());
    } on PlatformException catch (e) {
      isAuthenticating = false;
      authorized = 'Error - The operation was canceled because the API is locked out due to too many attempts. This occurs after 5 failed attempts, and lasts for ${start} seconds.}';
      print(e.message);
      emit(AuthenticateUserErrorState());
      return;
    }
    isAuthenticating = authenticated;
    authorized = authenticated ? 'Authorized' : 'Not Authorized';
    // authorized == 'Authorized' ? navigateAndFinish(context, LayoutScreen()) : null;
    authorized == 'Authorized' ? getLayoutData() : null;
    //     ? Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(builder: (context) =>  LayoutScreen()),
    //       (Route<dynamic> route) => false,
    // )
    //     : null;
  }



//-------------------------------------------------





  List<Map<String,dynamic>> allUsers =[
    {
      "id": 1,
      "name": "Osama Kamel",
      "type": "Bank",
      "accountNumber": "47896021"
    },
    {
      "id": 2,
      "name": "Osama",
      "type": "E-wallet",
      "accountNumber": "44444444"
    },
    {
      "id": 3,
      "name": "Eslam",
      "type": "Bank",
      "accountNumber": "22222222"
    },
    {
      "id": 4,
      "name": "Eldahshan",
      "type": "E-wallet",
      "accountNumber": "333333333"
    },
    {
      "id": 5,
      "name": "Ahmed",
      "type": "Bank",
      "accountNumber": "47896021"
    },
    {
      "id": 6,
      "name": "Hero",
      "type": "E-wallet",
      "accountNumber": "47896021"
    },
    {
      "id": 7,
      "name": "hero",
      "type": "Bank",
      "accountNumber": "47896021"
    },
    {
      "id": 8,
      "name": "Omar",
      "type": "E-wallet",
      "accountNumber": "47896021"
    },
    {
      "id": 9,
      "name": "Mohamed",
      "type": "Bank",
      "accountNumber": "47896021"
    },
    {
      "id": 10,
      "name": "Khaled",
      "type": "E-wallet",
      "accountNumber": "47896021"
    },
  ];

  List<Map<String,dynamic>> searchUser=[];

  void searchuser(){
    if (searchUser.length == 0){
      searchUser=allUsers;
    }
    else{
      searchUser = searchUser;
    }
    // emit(SearchUserToBankTransferState());
  }

  void runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = allUsers;
    }
    else
    {
      results = allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    searchUser=results;
    emit(SearchUserToBankTransferState());
  }


  WithdrawelModel? withdrawelModel;
  bool? isWithdrawal;
  String withdrawalErrorMessage = '';

  Future<void> userWithdrawal({
    required BuildContext context,
    required int amount,
    required int atm_id,
    required String accountType,
    required String transaction ,
})async{
    emit(WithdrawelLoadingState());
    await DioHelper.postData(
      path: 'atm/transaction1.php',
      data: {
        'transaction' : transaction ,
        'account_type' : accountType,
        'amount' : amount,
        'ATM_id' : 1,
      },
    ).then((value){
      // print(value.data);
      // print(value.data.runtimeType);
      // withdrawelModel = WithdrawelModel.fromJson(jsonDecode(value.data));
      // print(withdrawelModel);
      print(value.data);
      print(value.data.runtimeType);
      if(value.data == '"successed"'){
        print('Yessssssssss');
        isWithdrawal = true;
      }
      else{
        print('Noooooooooooo');
        isWithdrawal = false;
        withdrawalErrorMessage = value.data;
      }
      emit(WithdrawelSuccessState());
    }).catchError((onError){
      print('Error When Do Withdrawel Transaction ======> ${onError.toString()}');
      emit(WithdrawelErrorState());
    });
  }







}

