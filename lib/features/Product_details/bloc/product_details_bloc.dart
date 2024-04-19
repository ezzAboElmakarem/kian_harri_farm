import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/Product_details/repo/product_details_repo.dart';
import 'package:kian_sheeps_projects/main_models/product_model.dart';

class ProductDetailsBloc extends Bloc<AppEvent, AppState> {
  ProductDetailsBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static ProductDetailsBloc of(context) => BlocProvider.of(context);
  ProductModel productDetailsData = ProductModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await ProductDetailsRepo.getOfferDetailsData(
        offerId: event.arguments.toString(),
      );
      if (response.statusCode == 200) {
        productDetailsData = ProductModel.fromJson(response.data);
        log('Get product details  data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get product details  data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in get product details data ${e.toString()}");
    }
  }
}
