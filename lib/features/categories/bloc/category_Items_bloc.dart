// ignore_for_file: use_build_context_synchronously, file_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/categories/bloc/categories_bloc.dart';
import 'package:kian_sheeps_projects/features/categories/models/sub_cate_offers_model.dart';
import 'package:kian_sheeps_projects/features/categories/repo/categories_repo.dart';
import 'package:kian_sheeps_projects/features/offers/models/all_offer_model.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class CategoryItemsBloc extends Bloc<AppEvent, AppState> {
  CategoryItemsBloc() : super(Loading()) {
    on<Read>(_getOffersData);
    on<Click>(_filter);
  }
  static CategoryItemsBloc of(context) => BlocProvider.of(context);
  String? categoryId;

  SubCategoryOffersModel subCategoryOffersModel = SubCategoryOffersModel();
  AllOffersModel allOffersData = AllOffersModel();

  _getOffersData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());

    try {
      Response response = await CategoriesRepo.getCategoryOffersData(
          subId: event.arguments as String);
      if (response.statusCode == 200) {
        log("Done Sub category Offers ${response.statusCode}");

        emit(Done());
        subCategoryOffersModel = SubCategoryOffersModel.fromJson(response.data);
      } else {
        emit(Error());

        log("Error Sub category Offers ${response.statusCode}");
        showSnackBar(RouteUtils.context, response.data['message']);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part Sub category: $e");

      showSnackBar(RouteUtils.context, e.toString());
    }
  }

  _filter(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());

    try {
      Response response = await CategoriesRepo.filter(
        catId: CategoriesBloc.of(RouteUtils.context).categoryId ?? "0",
        filterId: event.arguments.toString(),
      );
      if (response.statusCode == 200) {
        log("Done filter ${response.statusCode}");

        emit(Done());
        subCategoryOffersModel = SubCategoryOffersModel.fromJson(response.data);
      } else {
        emit(Error());

        log("Error filter ${response.statusCode}");
        showSnackBar(RouteUtils.context, response.data['message']);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part filter: $e");

      showSnackBar(RouteUtils.context, e.toString());
    }
  }
}
