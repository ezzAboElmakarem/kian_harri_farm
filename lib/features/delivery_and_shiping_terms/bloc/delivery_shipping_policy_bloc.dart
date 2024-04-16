// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/delivery_and_shiping_terms/model/delivery_shipping_policy_model.dart';
import 'package:kian_sheeps_projects/features/delivery_and_shiping_terms/repo/delivery_shipping_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class ShippingPolicyBloc extends Bloc<AppEvent, AppState> {
  ShippingPolicyBloc() : super(Loading()) {
    on<Get>(getData);
  }
  static ShippingPolicyBloc get(context) => BlocProvider.of(context);
  ShippingPolicyModel shippingPolicyData = ShippingPolicyModel();

  getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await ShippingPolicyRepository.getShippingPolicy();
      if (response.statusCode == 200) {
        shippingPolicyData = ShippingPolicyModel.fromJson(response.data);
        log('Get shipping policy data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
        log('Get shipping policy data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
      log("catch error in get shipping policy data ${e.toString()}");
    }
  }
}
