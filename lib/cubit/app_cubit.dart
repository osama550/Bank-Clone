import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/cubit/app_state.dart';

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


  IconData favoriteIcon = Icons.star_border_rounded;
  bool isFavorite = false;
  Color favoriteColor = Colors.grey;
  void changeFavoriteIcon(){
    isFavorite = !isFavorite;
    if(isFavorite){
      favoriteIcon = Icons.star_rounded;
      favoriteColor = Colors.amber;
    }
    else{
      favoriteIcon = Icons.star_border_rounded;
      favoriteColor = Colors.grey;
    }
    emit(ChangeFavoriteIconState());
  }



  // List images = ['images/Picture2.png','images/Picture3.png','images/Picture4.png','images/Picture5.png',
  //   'images/Picture6.png','images/Picture7.png','images/Picture8.png','images/Picture9.png',
  //   'images/Picture10.png','images/Picture11.png','images/Picture12.png','images/Picture13.png'];
  //
  // List titles = ['Electricity','Internet','Water','E-Wallet','School Fees', 'Gas', 'Garbage',
  //   'Sanitation', 'Phone', 'Land Line', 'Television', 'Games'];



}
