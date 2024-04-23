// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/order_success/views/order_success_view.dart';
import 'package:kian_sheeps_projects/features/payment/repo/payment_repo.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class PaymentBloc extends Bloc<AppEvent, AppState> {
  PaymentBloc() : super(Start()) {
    on<Add>(_addPaymentOrder);
  }
  static PaymentBloc of(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController extraPhoneController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  String? addressId;
  String? paymentType;

  _addPaymentOrder(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Map<String, dynamic> body = {
        "name": nameController.text,
        "phone": phoneController.text,
        "secondphone": extraPhoneController.text,
        "email": emailController.text,
        "address_id": addressId,
        "note": notesController.text,
        "payment": paymentType ?? 'offline',
      };
      Response response = await PaymentRepository.addPaymentOrder(body: body);
      if (response.statusCode == 200) {
        log('Add payment order Successfuly ');
        emit(Done());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
        RouteUtils.navigateAndPopUntilFirstPage(const OrderSuccess());
      } else {
        emit(Error());
        log('Add payment order Failed with Status code ${response.statusCode}');
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
      }
    } catch (e) {
      emit(Error());
      log("catch error in for Adding payment order data ${e.toString()}");
      showSnackBar(RouteUtils.context, "catch an error ==>$e");
    }
  }
}
