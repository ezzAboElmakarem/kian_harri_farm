// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/service_rate/model/service_rate_model.dart';
import 'package:kian_sheeps_projects/features/service_rate/repo/service_rate_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class ServiceRateBloc extends Bloc<AppEvent, AppState> {
  ServiceRateBloc() : super(Start()) {
    on<Click>(_getOrderDetailsData);
  }

  static ServiceRateBloc of(context) => BlocProvider.of(context);

  TextEditingController commentController = TextEditingController();

  RatingModel ratingModel = RatingModel(
    comment: "",
    deliverySpeed: "0",
    order: "0",
    satisfaction: "0",
    service: "0",
  );

  void fillBody({
    String? order,
    String? service,
    String? deliverySpeed,
    String? satisfaction,
    String? comment,
  }) {
    ratingModel = ratingModel.copyWith(
      order: order,
      comment: comment,
      service: service,
      deliverySpeed: deliverySpeed,
      satisfaction: satisfaction,
    );
  }

/////add
  void resetValues() {
    ratingModel = RatingModel(
      comment: "",
      deliverySpeed: "0",
      order: "0",
      satisfaction: "0",
      service: "0",
    );
  }

  printValues() {
    log(ratingModel.order.toString());
    log(ratingModel.service.toString());
    log(ratingModel.deliverySpeed.toString());
    log(ratingModel.satisfaction.toString());
    log(ratingModel.comment.toString());
  }

  _getOrderDetailsData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    printValues();
    Map<String, dynamic> body = {
      "order": ratingModel.order,
      "order_id": event.arguments.toString(),
      "service": ratingModel.service,
      "deliverySpeed": ratingModel.deliverySpeed,
      "satisfaction": ratingModel.satisfaction,
      "comment": ratingModel.comment,
    };
    try {
      Response response = await ServiceRateRepository.sendRate(body: body);
      if (response.statusCode == 200) {
        log("Done my orders details${response.statusCode}");
        log("response => $response");
        emit(Done());
        RouteUtils.pop(); /////add

        showSnackBar(RouteUtils.context, " Rating send successfully");

        // /////add
        resetValues();
      } else {
        emit(Error());

        log("Error  service rate ${response.statusCode}");
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
        // /////add
        resetValues();
      }
    } catch (e) {
      emit(Error());

      log("catch error in service rate: $e");

      showSnackBar(RouteUtils.context, "catch an error ==>$e");
    }
  }
}
