// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/cart/model/cart_model.dart';
import 'package:kian_sheeps_projects/features/cart/repo/cart_repo.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class CartBloc extends Bloc<AppEvent, AppState> {
  CartBloc() : super(Loading()) {
    on<Get>(_getData);
    on<Delete>(_deleteCartItem);
    on<Clear>(_deleteAllCart);
    on<Add>(_increaseItem);
    on<Click>(_decreaseItem);
  }
  static CartBloc of(context) => BlocProvider.of(context);
  CartModel cartData = CartModel();
  CartModel increaseItemData = CartModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await CartRepo.getData();
      if (response.statusCode == 200) {
        cartData = CartModel.fromJson(response.data);
        log('Get  cart data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get cart data  Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in  get cart data  ${e.toString()}");
    }
  }

  _deleteCartItem(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> offerId = {
      "offer_id": event.arguments.toString(),
    };
    try {
      Response response = await CartRepo.deleteCartItem(body: offerId);
      log("response => $response");
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        emit(Done());
        log("delete item cart > ${response.data}");
        showSnackBar(RouteUtils.context, "Order Deleted Successfully");
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

  _deleteAllCart(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await CartRepo.deleteAllCart();
      if (response.statusCode == 200) {
        log('Get delete  cart Successfuly ');
        emit(Done());
        RouteUtils.navigateTo(HomeView());
      } else {
        emit(Error());
        log('Get  delete cart   Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in  delete cart  ${e.toString()}");
    }
  }

  _increaseItem(AppEvent event, Emitter<AppState> emit) async {
    emit(Start());
    Map<String, dynamic> offerId = {
      "offer_id": event.arguments.toString(),
    };
    try {
      Response response = await CartRepo.increaseItem(body: offerId);
      log("response => $response");
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 422) {
        increaseItemData = CartModel.fromJson(response.data);

        emit(Done());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");

        log("increase item cart > ${response.data}");
        // CartBloc.of(RouteUtils.context).add(Get());
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

  _decreaseItem(AppEvent event, Emitter<AppState> emit) async {
    emit(Start());
    Map<String, dynamic> offerId = {
      "offer_id": event.arguments.toString(),
    };
    try {
      Response response = await CartRepo.decreaseItem(body: offerId);
      log("response => $response");
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 422) {
        increaseItemData = CartModel.fromJson(response.data);

        response.data['message'] == 'cart'
            ? emit(Done())
            : showSnackBar(RouteUtils.context, " ${response.data['message']}");

        log("increase item cart > ${response.data}");
        // CartBloc.of(RouteUtils.context).add(Get());
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
