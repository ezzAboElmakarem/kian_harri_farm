// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/categories/bloc/category_Items_bloc.dart';
import 'package:kian_sheeps_projects/features/categories/models/categories_model.dart';
import 'package:kian_sheeps_projects/features/categories/repo/categories_repo.dart';
import 'package:kian_sheeps_projects/features/offers/models/all_offer_model.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class CategoriesBloc extends Bloc<AppEvent, AppState> {
  CategoriesBloc() : super(Loading()) {
    on<Get>(_getCategoryData);
  }
  static CategoriesBloc of(context) => BlocProvider.of(context);
  String? categoryId;

  SubCategoriesModel subCategoryData = SubCategoriesModel();
  AllOffersModel allOffersData = AllOffersModel();

  _getCategoryData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      categoryId = event.arguments as String;
      Response response = await CategoriesRepo.getData(catId: categoryId!);

      if (response.statusCode == 200) {
        log("Done Sub category ${response.statusCode}");
        subCategoryData = SubCategoriesModel.fromJson(response.data);

        emit(Done());
        CategoryItemsBloc.of(RouteUtils.context).add(Read(
            arguments: subCategoryData.data?.subCategory?[0].id.toString()));
      } else {
        emit(Error());

        log("Error Sub category ${response.statusCode}");
        showSnackBar(RouteUtils.context, response.data['message']);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part Sub category: $e");

      showSnackBar(RouteUtils.context, e.toString());
    }
  }
}
