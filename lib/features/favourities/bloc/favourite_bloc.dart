// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/favourities/model/favourite_model.dart';
import 'package:kian_sheeps_projects/features/favourities/repo/favourite_repo.dart';
import 'package:kian_sheeps_projects/features/home/bloc/home_bloc.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class FavouriteBloc extends Bloc<AppEvent, AppState> {
  FavouriteBloc() : super(Start()) {
    on<Get>(_getData);
    on<Click>(_setFavourite);
  }
  static FavouriteBloc get(context) => BlocProvider.of(context);
  FavouriteModel favouriteData = FavouriteModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await FavouriteRepository.getData();
      if (response.statusCode == 200) {
        favouriteData = FavouriteModel.fromJson(response.data);
        log('Get favourite  data Successfuly ');
        log("${favouriteData.data?.product?.length}");
        emit(Done());
        if (favouriteData.data!.product!.isEmpty) {
          emit(Empty());
        }
      } else {
        if ("${response.data['message']}" == "Unauthenticated.") {
          emit(Empty());
          showSnackBar(RouteUtils.context,
              " please Login  to save you favourites Products");
        } else {
          emit(Error());
          showSnackBar(RouteUtils.context, " ${response.data['message']}");
          log('Get favourite  data Failed with Status code ${response.statusCode}');
        }
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
      log("catch error in get favourite data ${e.toString()}");
    }
  }

  _setFavourite(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> body = event.arguments as Map<String, dynamic>;
    try {
      Response response = await FavouriteRepository.setFavorite(body: body);
      if (response.statusCode == 200) {
        log("Done my orders details${response.statusCode}");

        emit(Done());
        HomeBloc.get(RouteUtils.context).add(Get());
        FavouriteBloc.get(RouteUtils.context).add(Get());
      } else {
        if ("${response.data['message']}" == "Unauthenticated.") {
          emit(Empty());
          showSnackBar(RouteUtils.context,
              " please Login  to save you favourites Products");
        } else {
          emit(Error());
          log("Error  my orders details ${response.statusCode}");
          showSnackBar(RouteUtils.context, " ${response.data['message']}");
        }
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part  my orders details: $e");

      showSnackBar(RouteUtils.context, "catch an error ==>$e");
    }
  }
}
