// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/notifications/model/notification_model.dart';
import 'package:kian_sheeps_projects/features/notifications/repo/notification_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class NotificationBloc extends Bloc<AppEvent, AppState> {
  NotificationBloc() : super(Loading()) {
    on<Get>(getData);
  }
  static NotificationBloc get(context) => BlocProvider.of(context);
  NotificationModel data = NotificationModel();

  getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await NotificationRepo.getData();
      if (response.statusCode == 200) {
        data = NotificationModel.fromJson(response.data);
        log('Get data Successfuly ');
        log(data.data![0].toString());
        emit(Done());
        if (data.data!.isEmpty) {
          emit(Empty());
        }
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, "ERROR : ${response.data['message']}");
        log('Get data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
      log("catch error in get data ${e.toString()}");
    }
  }
}
