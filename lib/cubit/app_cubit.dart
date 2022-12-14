
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/app_state.dart';
import 'package:project/models/layout_model.dart';
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
  int? id,
}){
  if(text.isEmpty){
    text= text;
  }
  else{
    text = text.substring(0, text.length-1);
  }
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
  }
    emit(ChangeIsBankAccountEmptyState());
}
//-------------------------------------

  String result = '';
  var transferResult = '';
  var addTransferRecipientResult = '';
  var amount = '';
void addTextToBankAccount({
  required String num,
  required String amount,
  required int id,
}){
  emit(AddTextToBankAccountState());
  if(isMaxLength(text: amount)){
    amount = amount + num;
    print(amount);
    print(amount.length);
  }
  else{
    amount = amount;
  }
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
  return text.length < 8? true : false;
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
    }
}
//-------------------------------------------------

  LayoutModel? layoutModel;
  String? data;
void getLayoutData()async{
  emit(GetLayoutLoadingState());
    await DioHelper.getData(
      path: 'atm/home.php',
    ).then((value){
      // print(value.data.runtimeType);
      // print(value.data);
      // layoutModel = LayoutModel.fromJson(value.data);
      layoutModel = LayoutModel.fromJson(jsonDecode(value.data));
      print('Type of Data ============ ${layoutModel.runtimeType}');
      print(layoutModel!.totalBalance);
      print('Get Layout Data Successfully');
      emit(GetLayoutSuccessState());
    }).catchError((error){
      emit(GetLayoutErrorState());
      print('Error When Get Layout Data Data =====> ${error.toString()}');
  });
}






}

