// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/search/models/search_model.dart';
import 'package:kian_sheeps_projects/features/search/repo/search_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class SearchBloc extends Bloc<AppEvent, AppState> {
  SearchBloc() : super(Start()) {
    on<Get>(getData);
  }
  static SearchBloc get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  SearchModel searchData = SearchModel();
  /////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////     METHODS   /////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////////////
  getData(AppEvent event, Emitter<AppState> emit) async {
    if (!formkey.currentState!.validate()) return;
    emit(Loading());
    try {
      String body = searchController.text;

      Response response = await SearchRepo.getData(searchQuery: body);
      log("response => $response");
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        emit(Done());
        emit(Done());
        searchData = SearchModel.fromJson(response.data);
        print(" First " + searchData!.data![0].toString());
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, "${response.data['message']}");
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, '"catch an error ==>$e"');

      log(e.toString());
      log("catch an error ");
    }
  }
}
