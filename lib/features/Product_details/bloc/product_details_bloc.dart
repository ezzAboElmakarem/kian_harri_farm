// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/Product_details/model/product_details_model.dart';
import 'package:kian_sheeps_projects/features/Product_details/repo/product_details_repo.dart';
import 'package:kian_sheeps_projects/features/cart/bloc/cart_bloc.dart';
import 'package:kian_sheeps_projects/features/cart/views/cart_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class ProductDetailsBloc extends Bloc<AppEvent, AppState> {
  ProductDetailsBloc() : super(Loading()) {
    on<Get>(_getData);
    on<Click>(_addToCart);
  }
  static ProductDetailsBloc of(context) => BlocProvider.of(context);
  ProductDetailsModel productDetailsData = ProductDetailsModel();
  // ProductDetailsModel smilarProdactsModel = ProductDetailsModel();

  String? offerId,
      quantity,
      orderTypeId,
      sizeId,
      wrappingId,
      cuttingId,
      addition,
      excuteTime;

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await ProductDetailsRepo.getOfferDetailsData(
        offerId: event.arguments.toString(),
      );
      if (response.statusCode == 200) {
        productDetailsData = ProductDetailsModel.fromJson(response.data);
        // smilarProdactsModel = ProductDetailsModel.fromJson(response.data);
        // log('${response.data['similarProduct']}');
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

  _addToCart(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> body = event.arguments as Map<String, dynamic>;
    try {
      Response response = await ProductDetailsRepo.addToCart(body: body);
      if (response.statusCode == 200) {
        log("Add To cart Successfully${response.statusCode}");

        emit(Done());
        // HomeBloc.get(RouteUtils.context).add(Get());
        CartBloc.of(RouteUtils.context).add(Get());

        RouteUtils.navigateAndPopUntilFirstPage(const CartView());
        offerId = quantity = orderTypeId =
            sizeId = wrappingId = cuttingId = addition = excuteTime = '';

        showSnackBar(
            RouteUtils.context, " Your Order Added to Cart Successfully");
      } else {
        if ("${response.data['message']}" == "Unauthenticated.") {
          emit(Empty());
          showSnackBar(
              RouteUtils.context, " Please login before make Your Order");
        } else {
          emit(Error());

          log("Add To cart Failed ${response.statusCode}");
          showSnackBar(RouteUtils.context, " Please Complete  Your Order");
        }
      }
    } catch (e) {
      emit(Error());

      log("catch  error  Add To cart: $e");

      showSnackBar(RouteUtils.context, "catch an error ==>$e");
    }
  }
}
