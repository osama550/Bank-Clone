import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:project/components/components.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/models/all_transfer.dart';
import 'package:project/models/electricity_model.dart';
import 'package:project/models/internet_model.dart';
import 'package:project/models/layout_model.dart';
import 'package:project/models/withdrawel_model.dart';
import 'package:project/modules/deposite/confirm_deposite_screen.dart';
import 'package:project/modules/deposite/deposite_screen.dart';
import 'package:project/modules/in_out_payment/history.dart';
import 'package:project/modules/in_out_payment/requested.dart';
import 'package:project/modules/in_out_payment/scheduled.dart';
import 'package:project/modules/transfar_money/all_users.dart';
import 'package:project/modules/transfar_money/bank_screen.dart';
import 'package:project/modules/transfar_money/ewallet_screen.dart';
import 'package:project/modules/transfar_money/favorite_screen.dart';
import 'package:project/modules/withdrawel/withdrawel_Payment_screen.dart';
import 'package:project/network/local/cashe_helper.dart';
import 'package:project/network/remote/dio_helper.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool speaker = true;

  void changeSpeak({bool? isSpeaker}) {
    if (isSpeaker != null) {
      speaker = isSpeaker;
      emit(ChangeSpeakerState());
    } else {
      speaker = !speaker;
      CacheHelper.putBoolean(key: 'speaker', value: speaker).then((value) {
        print(value);
        emit(ChangeSpeakerState());
      });
    }
  }

  int billIndex = 0;

  List<Map> bills = [
    {
      'title': 'Electricity',
      'image': 'images/Picture2.png',
    },
    {
      'title': 'Internet',
      'image': 'images/Picture3.png',
    },
    {
      'title': 'Water',
      'image': 'images/Picture4.png',
    },
    {
      'title': 'E-Wallet',
      'image': 'images/Picture5.png',
    },
    {
      'title': 'School Fees',
      'image': 'images/Picture6.png',
    },
    {
      'title': 'Gas',
      'image': 'images/Picture7.png',
    },
    {
      'title': 'Garbage',
      'image': 'images/Picture8.png',
    },
    {
      'title': 'Sanitation',
      'image': 'images/Picture9.png',
    },
    {
      'title': 'Phone',
      'image': 'images/Picture10.png',
    },
    {
      'title': 'Land Line',
      'image': 'images/Picture11.png',
    },
    {
      'title': 'Television',
      'image': 'images/Picture12.png',
    },
    {
      'title': 'Games',
      'image': 'images/Picture13.png',
    },
  ];

  void selectBillScreen(int index) {
    emit(ChangePaymentBillScreenState());
    billIndex = index;
  }

  List<Widget> inOutScreens = [
    HistoryScreen(),
    ScheduledScreen(),
    RequestedScreen(),
  ];

  List<Widget> transferScreens = [
    AllUsersScreen(),
    FavoriteScreen(),
    BankScreen(),
    EWalletScreen(),
  ];

  int numberOfInOutScreen = 0;

  void selectInOutPayment({
    required int index,
  }) {
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
    required bool isFavorite,
    required String type,
    required String id,
    required String favorite_state,
  }) async {
    emit(ChangeFavoriteIconState());
    isFavorite = !isFavorite;
    await DioHelper.postData(
      path: 'atm/favorite.php',
      data: {
        'account_type': 'current',
        'type': type,
        'account_no': id,
        'favorite': isFavorite.toString(),
      },
    ).then((value) {
      getAllTransferUsers();
      emit(ChangeFavoriteIconSuccessState());
    }).catchError((error) {
      print('Error When Edit Favorite User Transfer ====> ${error.toString()}');
      emit(ChangeFavoriteIconErrorState());
    });
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
  }) {
    if (text.isEmpty) {
      text = text;
    } else {
      text = text.substring(0, text.length - 1);
    }
    emit(ChangeIsBankAccountEmptyState());

    switch (id) {
      case 1:
        billResult = text;
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
      case 5:
        electricityMeterNumber = text;
        break;
      case 6:
        phoneNumber = text;
        break;
    }
  }

//-------------------------------------
  void isBankTransferEmpty({
    required String text,
  }) {
    if (transferResult.isEmpty) {
      transferResult = text;
    } else {
      transferResult = text.substring(0, text.length - 1);
    }
    emit(AddTextToBankTransferState());
  }

//-------------------------------------------------

  var result = '';
  var billResult = '';
  var transferResult = '';
  var addTransferRecipientResult = '';
  var withdrawelResult = '';
  var electricityMeterNumber = '';
  var phoneNumber = '';
  void addTextToBankAccount({
    required String num,
    required String amount,
    required int id,
  }) {
    if (amount.length == 0 && id == 6 && num == '0') {
      amount += num;
    } else if (amount.length == 0 && num == '') {
      amount = amount;
    } else if (isMaxLength(text: amount)) {
      amount = amount + num;
      print(amount);
    } else {
      amount = amount;
    }
    emit(AddTextToBankAccountState());
    switch (id) {
      case 1:
        billResult = amount;
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
      case 5:
        electricityMeterNumber = amount;
        break;
      case 6:
        phoneNumber = amount;
        break;
    }
  }

//-------------------------------------------------
  // Initial Selected Value
  String dropdownvalueOfElectricity = 'Cairo Electricity Production';

  // List of items in our dropdown menu
  var itemsOfElectricity = [
    'Cairo Electricity Production',
    'Company Alexandria Electricity',
    'Canal Electricity Distribution',
    'South Delta Electricity ',
  ];
  void OnChangeItemElectricity(String? newValue) {
    dropdownvalueOfElectricity = newValue!;
    emit(AddDropDownValueState());
  }

//
  //-------------------------------------------------
  // Initial Selected Value
  String dropdownvalueOfInternet = 'We';

  // List of items in our dropdown menu
  var itemsOfInternet = [
    'We',
    'Vodafone',
    'Orange',
    'Etisalat',
  ];
  void OnChangeItemInternet(String? newValue) {
    dropdownvalueOfElectricity = newValue!;
    emit(AddDropDownValueState());
  }
//
//-------------------------------------------------

//  this function used to limit the amount of money that can transfer or payment.
  bool isMaxLength({
    required String text,
  }) {
    return text.length <= 12 ? true : false;
  }
//-------------------------------------------------

  void clearAmount({
    required int id,
  }) {
    switch (id) {
      case 1:
        billResult = '';
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
      case 5:
        electricityMeterNumber = '';
        break;
      case 6:
        phoneNumber = '';
        break;
    }
  }

//-------------------------------------------------
  void getUserAccountType({
    required String account_type,
  }) {
    emit(GetLodingUserAccountType());
    DioHelper.postData(path: 'atm/type.php', data: {
      // "account_type" : layoutModel!.clientAccounts[userAccountIndex].accountType
      "account_type": account_type
    }).then((value) {
      emit(GetSucessUserAccountType());
      print('Know User Account Type Done : ${value.data}');
    }).catchError((error) {
      emit(GetErrorUserAccountType());
      print('Error When getUserAccountType =====> ${error.toString()}');
    });
  }

//-------------------------------------------------

  ElectricityModel? electricityModel;
  void CheckElectricity({
    required String company,
    required String number,
  }) {
    emit(GetLodingNumberOfElectricity());
    DioHelper.postData(path: 'atm/electricity.php',
      data: {
      "company": company,
      "num": number,
    }).then((value) {
      print('Know Number Of Electricity : ${value.data}');
      electricityModel = ElectricityModel.fromJson(jsonDecode(value.data));
      print('Electricity Data =====> ${electricityModel!.amount}');
      emit(GetSucessNumberOfElectricity());
    }).catchError((error) {
      emit(GetErrorUserAccountType());
      print('Error When getNumber Of Electricity =====> ${error.toString()}');
      emit(GetErrorNumberOfElectricity());
    });
  }
// -------------------------------------------------

  InternetModel? internetModel;
  void payInternet({
    required String number,
  }) {
    emit(GetLodingpayInternet());
    DioHelper.postData(path: 'atm/internet.php', data: {
      "company": "WE",
      "num": number,
    }).then((value){
      internetModel = InternetModel.fromJson(jsonDecode(value.data));
      print('Payment Internet Success : ${value.data}');
      print('Internet Data =====> ${internetModel!.amount}');
      emit(GetSucesspayInternet());
    }).catchError((error) {
      emit(GetErrorpayInternet());
      print('Error When Pay Internet =====> ${error.toString()}');
    });
  }
  //-------------------------------------------------

  LayoutModel? layoutModel;
  String? data;
  void getLayoutData() {
    emit(GetLayoutLoadingState());
    DioHelper.getData(
      path: 'atm/home.php',
    ).then((value) {
      // print(value.data.runtimeType);
      // print(value.data);
      // layoutModel = LayoutModel.fromJson(value.data);
      layoutModel = LayoutModel.fromJson(jsonDecode(value.data));
      // print(layoutModel!.totalBalance);
      print('Get Layout Data Successfully');
      emit(GetLayoutSuccessState());
    }).catchError((error) {
      emit(GetLayoutErrorState());
      print('Error When Get Layout Data Data =====> ${error.toString()}');
    });
  }

  var userAccountIndex;
  void userAccount({
    required int index,
  }) {
    emit(ChangeUserAccountState());
    userAccountIndex = index;
  }

  void homeSpeaker() {
    if (userAccountIndex == 0) {
      speak(text: 'تم إختيار الحساب الموفر');
    } else if (userAccountIndex == 1) {
      speak(text: 'تم إختيار الحساب الحالي');
    } else if (userAccountIndex == 2) {
      speak(text: 'تم إختيار بطاقة الأئتمان');
    } else {
      speak(text: 'تم إختيار الراتب');
    }
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
      authorized =
          'Error - The operation was canceled because the API is locked out due to too many attempts. This occurs after 5 failed attempts, and lasts for ${start} seconds.}';
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

  List<Map<String, dynamic>> allUsers = [
    {
      "id": 1,
      "name": "Osama Kamel",
      "type": "Bank",
      "accountNumber": "47896021"
    },
    {"id": 2, "name": "Osama", "type": "E-wallet", "accountNumber": "44444444"},
    {"id": 3, "name": "Eslam", "type": "Bank", "accountNumber": "22222222"},
    {
      "id": 4,
      "name": "Eldahshan",
      "type": "E-wallet",
      "accountNumber": "333333333"
    },
    {"id": 5, "name": "Ahmed", "type": "Bank", "accountNumber": "47896021"},
    {"id": 6, "name": "Hero", "type": "E-wallet", "accountNumber": "47896021"},
    {"id": 7, "name": "hero", "type": "Bank", "accountNumber": "47896021"},
    {"id": 8, "name": "Omar", "type": "E-wallet", "accountNumber": "47896021"},
    {"id": 9, "name": "Mohamed", "type": "Bank", "accountNumber": "47896021"},
    {
      "id": 10,
      "name": "Khaled",
      "type": "E-wallet",
      "accountNumber": "47896021"
    },
  ];

  WithdrawelModel? withdrawelModel;
  bool? isWithdrawal;
  String withdrawalErrorMessage = '';

  Future<void> userWithdrawal({
    required BuildContext context,
    required int amount,
    required int atm_id,
    required String accountType,
    required String transaction,
  }) async {
    emit(WithdrawelLoadingState());
    await DioHelper.postData(
      path: 'atm/transaction1.php',
      data: {
        'transaction': transaction,
        'account_type': accountType,
        'amount': amount,
        'ATM_id': 1,
      },
    ).then((value) {
      // print(value.data);
      // print(value.data.runtimeType);
      // withdrawelModel = WithdrawelModel.fromJson(jsonDecode(value.data));
      // print(withdrawelModel);
      print(value.data);
      print(value.data.runtimeType);
      if (value.data == '"successed"') {
        print('Yessssssssss');
        isWithdrawal = true;
        withdrawelResult = '';
      } else {
        print('Noooooooooooo');
        isWithdrawal = false;
        withdrawalErrorMessage = value.data;
      }
      emit(WithdrawelSuccessState());
    }).catchError((onError) {
      print(
          'Error When Do Withdrawel Transaction ======> ${onError.toString()}');
      emit(WithdrawelErrorState());
    });
  }

  FlutterTts flutterTts = FlutterTts();
  void speak({
    required String text,
  }) async {
    await flutterTts.speak(text);
  }

  void stop() async {
    await flutterTts.stop();
    await speechToText!.stop();
  }

  var tabIndex = 0;
  void changeTabBarIndex(int index) {
    tabIndex = index;
    emit(ChangeTabBarState());
  }

  List transferUsers = [];
  List transferFavoriteUsers = [];
  List transferBankUsers = [];
  List transferWalletUsers = [];

  void getAllTransferUsers(
      // required String transfer_to,
      // required int id,
      // required String type,
      // required bool favorite,
      ) async {
    emit(GetAllTransferUsersLoadingState());
    await DioHelper.postData(
      path: 'atm/alltransfer.php',
      data: {
        'account_type': 'current',
      },
    ).then((value) {
      transferUsers = [];
      transferFavoriteUsers = [];
      transferBankUsers = [];
      transferWalletUsers = [];

      // transferModel = transferModel.add(TransferUsersModel.fromJson(jsonDecode(value.data)));
      transferUsers.addAll(jsonDecode(value.data));
      for (int i = 0; i < transferUsers.length; i++) {
        if (transferUsers[i]['Favourit']) {
          transferFavoriteUsers.add(transferUsers[i]);
        }
        if (transferUsers[i]['Type'] == 'bank') {
          transferBankUsers.add(transferUsers[i]);
        } else {
          transferWalletUsers.add(transferUsers[i]);
        }
      }

      print(transferUsers.length);
      print(transferFavoriteUsers.length);

      print('Get All Transfer Users...');
      emit(GetAllTransferUsersSuccessState());
    }).catchError((error) {
      emit(GetAllTransferUsersErrorState());
      print('Error When Get Transfer Users ${error.toString()}');
    });
  }

  List searchUser = [];

  void search() {
    if (searchUser.length == 0) {
      if (tabIndex == 0) {
        searchUser = transferUsers;
      } else if (tabIndex == 1) {
        searchUser = transferFavoriteUsers;
      } else if (tabIndex == 2) {
        searchUser = transferBankUsers;
      } else if (tabIndex == 3) {
        searchUser = transferWalletUsers;
      }
    } else {
      searchUser = searchUser;
    }
    emit(SearchToBankTransferState());
  }

  void runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      if (tabIndex == 0) {
        results = transferUsers;
      } else if (tabIndex == 1) {
        results = transferFavoriteUsers;
      } else if (tabIndex == 2) {
        results = transferBankUsers;
      } else if (tabIndex == 3) {
        results = transferWalletUsers;
      }
    } else {
      if (tabIndex == 0) {
        results = transferUsers
            .where((user) => user['Transfer_To']
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      } else if (tabIndex == 1) {
        results = transferFavoriteUsers
            .where((user) => user['Transfer_To']
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      } else if (tabIndex == 2) {
        results = transferBankUsers
            .where((user) => user['Transfer_To']
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      } else if (tabIndex == 3) {
        results = transferWalletUsers
            .where((user) => user['Transfer_To']
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }
    }
    searchUser = results;
    emit(SearchUserToBankTransferState());
  }

//////////////////////////////////////////////////////////////////////////////////

  stt.SpeechToText? speechToText;
  bool isListening = false;
  String text = 'Welcome Dark Hero';
  double confidence = 1.0;
  bool isSpeak = true;

  void listen({
    required bool userSpeak,
  }) async {
    speechToText = stt.SpeechToText();
    bool available = await speechToText!.initialize(
        // onStatus: (value) => print('onStatus: ====> $value'),
        // onError: (value) => print('onError: ====> $value'),
        );
    if (userSpeak) {
      if (available) {
        emit(UserSpeakState());
        isListening = true;
        speechToText!.listen(
          onResult: (value) {
            text = value.recognizedWords;
            result = value.recognizedWords;
            // print(text);
            if (value.hasConfidenceRating && value.confidence > 0) {
              confidence = value.confidence;
            }
          },
        );
      } else {
        emit(UserStopState());
        isListening = false;
        speechToText!.stop();
      }
    } else {
      emit(UserStopState());
      isListening = false;
      speechToText!.stop();
    }
  }

  void transferMoney({
    required String account_type,
    required String type,
    required var transfer_to,
    required int amount,
  }) async {
    emit(TransferMoneyLoadingState());
    await DioHelper.postData(
      path: 'atm/transaction2.php',
      data: {
        // 'account_type' : cubit.layoutModel!.clientAccounts[cubit.userAccountIndex].accountType!,
        'account_type': account_type,
        'type': type,
        'transferto': transfer_to,
        'amount': amount,
        'ATM_id': 1,
      },
    ).then((value) {
      emit(TransferMoneySuccessState());
      print(value.data);
    }).catchError((error) {
      emit(TransferMoneyErrorState());
      print('Error When Transfer Money =====> ${error.toString()}');
    });
  }

  bool isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return int.tryParse(str) != null;
  }

  void robotHelper({
    required BuildContext context,
    required String message,
  }) {
    try {
      List words = message.split(' ');
      if ((message.contains('سحب')) || (message.contains('اسحب'))) {
        for (int i = 0; i < words.length; i++) {
          if (isNumeric(words[i])) {
            if (i != words.length - 1) {
              if (words[i + 1] == 'الف') {
                withdrawelResult = words[i] + '000';
              } else {
                withdrawelResult = words[i];
              }
            } else {
              withdrawelResult = words[i];
            }
            print(
                'Yesssssssss There Are a Number In Text ======> ${withdrawelResult}');
            print(withdrawelResult);
            userAccountIndex = 1;
            navigateTo(context, WithdrawelPaymentScreen());
          }
        }
      } else if (message.contains('ايداع')) {
        navigateTo(context, ConfirmDepositScreen());
      }
      text = '';
      print(text);
    } catch (error) {
      print('Error In Robot Helper ======> ${error.toString()}');
    }
  }

  var qrstr = "let's Scan it";
  void SaveQr(value) {
    qrstr = value;
    emit(SaveQrState());
  }

  void ErrorQr() {
    qrstr = 'unable to read this';
    emit(ErrorQrState());
  }
}
