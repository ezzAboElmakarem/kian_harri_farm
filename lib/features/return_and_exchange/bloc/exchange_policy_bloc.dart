// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/return_and_exchange/model/exchange_policy_model.dart';
import 'package:kian_sheeps_projects/features/return_and_exchange/repo/exchange_policy_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class ExchangePolicyBloc extends Bloc<AppEvent, AppState> {
  ExchangePolicyBloc() : super(Loading()) {
    on<Get>(getData);
  }
  static ExchangePolicyBloc get(context) => BlocProvider.of(context);
  ExchangePolicyModel exchangePolicyData = ExchangePolicyModel();

  getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await ExchangePolicyRepository.getExchangePolicy();
      if (response.statusCode == 200) {
        exchangePolicyData = ExchangePolicyModel.fromJson(response.data);
        log('Get exchange policy data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
        log('Get exchange policy data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
      log("catch error in get exchange policy data ${e.toString()}");
    }
  }
}
