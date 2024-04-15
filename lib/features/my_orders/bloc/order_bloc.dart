// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/my_orders/model/order_model.dart';
import 'package:kian_sheeps_projects/features/my_orders/repo/order_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class MyOrdersBloc extends Bloc<AppEvent, AppState> {
  MyOrdersBloc() : super(Loading()) {
    on<Get>(getData);
  }
  static MyOrdersBloc get(context) => BlocProvider.of(context);
  MyOrdersModel ordersData = MyOrdersModel();

  getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    // try {
    Response response = await MyOrdersRepository.getMyOrders();
    if (response.statusCode == 200) {
      ordersData = MyOrdersModel.fromJson(response.data);
      log('Get orders data Successfuly ');
      emit(Done());
    } else {
      emit(Error());
      showSnackBar(RouteUtils.context, " ${response.data['message']}");
      log('Get orders data Failed with Status code ${response.statusCode}');
    }
    // } catch (e) {
    //   emit(Error());
    //   showSnackBar(RouteUtils.context, "catch an error ==>$e");
    //   log("catch error in get orders data ${e.toString()}");
    // }
  }
}
