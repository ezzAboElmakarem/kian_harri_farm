// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/offers/models/all_offer_model.dart';
import 'package:kian_sheeps_projects/features/offers/repo/all_offers_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class AllOffersBloc extends Bloc<AppEvent, AppState> {
  AllOffersBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static AllOffersBloc of(context) => BlocProvider.of(context);

  AllOffersModel allOffersData = AllOffersModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await AllOffersRepo.getData();
      if (response.statusCode == 200) {
        log("Done all offers${response.statusCode}");

        emit(Done());
        allOffersData = AllOffersModel.fromJson(response.data);
        print(" First " + allOffersData.data!.offers!.toString());
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
        log('Get  Offers data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
      log("catch error in get data ${e.toString()}");
    }
  }
}
