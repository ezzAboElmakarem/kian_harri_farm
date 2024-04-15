// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/order_details/model/order_details_model.dart';
import 'package:kian_sheeps_projects/features/order_details/repo/order_details_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class MyOrdersDetailsBloc extends Bloc<AppEvent, AppState> {
  MyOrdersDetailsBloc() : super(Start()) {
    on<Click>(_getOrderDetailsData);
  }

  static MyOrdersDetailsBloc of(context) => BlocProvider.of(context);

  MyOrderDetailsModel myOrdersDetailsData = MyOrderDetailsModel();

  _getOrderDetailsData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await MyOrdersDetailsRepository.getMyOrdersDetails(
          orderId: event.arguments.toString());
      if (response.statusCode == 200) {
        log("Done my orders details${response.statusCode}");
        myOrdersDetailsData = MyOrderDetailsModel.fromJson(response.data);

        emit(Done());
      } else {
        emit(Error());

        log("Error  my orders details ${response.statusCode}");
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part  my orders details: $e");

      showSnackBar(RouteUtils.context, "catch an error ==>$e");
    }
  }
}
