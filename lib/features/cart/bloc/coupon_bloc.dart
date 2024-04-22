// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/features/cart/repo/cart_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class CouponBloc extends Bloc<AppEvent, AppState> {
  CouponBloc() : super(Start()) {
    on<Click>(_addCoupon);
  }
  ////////////////////////////////////////////////////////////////////////
  ///  ////////////////////////////////////////////////////////////////////////
  ///   ///////////////////////////////   VARIBLES        /////////////////////////////////////////
  ///  ////////////////////////////////////////////////////////////////////////
  static CouponBloc get(context) => BlocProvider.of(context);
  TextEditingController coupon = TextEditingController();

  _addCoupon(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> couponMap = {
      "code": coupon.text,
    };
    try {
      Response response = await CartRepo.activeCoupon(body: couponMap);
      log("response => $response");
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        emit(Done());
        log("active coupon > ${response.data}");
        showSnackBar(RouteUtils.context, "active coupon  Successfully");
        CartBloc.of(RouteUtils.context).add(Get());
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, '"catch an error ==>$e"');

      log("catch an error ");
    }
  }
}
