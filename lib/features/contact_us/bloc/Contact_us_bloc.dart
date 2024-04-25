// ignore_for_file: use_build_context_synchronously, file_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/contact_us/model/contact_us_links_model.dart';
import 'package:kian_sheeps_projects/features/contact_us/repo/contact_us_repo.dart';
import 'package:kian_sheeps_projects/features/home/views/home_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class ContactUsBloc extends Bloc<AppEvent, AppState> {
  ContactUsBloc() : super(Loading()) {
    on<Get>(_getData);
    on<Click>(_sendMessage);
  }

  static ContactUsBloc of(context) => BlocProvider.of(context);
  ContacUsLinksModel contactUsLinksData = ContacUsLinksModel();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController message = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  ////////////////////////////////////////////////////////////////////////
  ///  ////////////////////////////////////////////////////////////////////////
  ///   ///////////////////////////////   METHODS        /////////////////////////////////////////
  ///  ////////////////////////////////////////////////////////////////////////

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await ContactUsRepo.getData();
      if (response.statusCode == 200) {
        contactUsLinksData = ContacUsLinksModel.fromJson(response.data);
        log('Get contact us data Successfully');
        emit(Done());
      } else {
        emit(Error());
        log('Get contact us data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in get contact us data ${e.toString()}");
    }
  }

  _sendMessage(AppEvent event, Emitter<AppState> emit) async {
    if (!formkey.currentState!.validate()) return;

    Map<String, dynamic> body = {
      "name": name.text,
      "email": email.text,
      "phone": phone.text,
      "message": message.text,
    };
    try {
      Response response = await ContactUsRepo.sendMessage(body: body);
      log("response => $response");
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        emit(Done());
        ContactUsBloc bloc = ContactUsBloc.of(RouteUtils.context);

        RouteUtils.navigateAndPopAll(HomeView());
        bloc.name.clear();
        bloc.phone.clear();
        bloc.email.clear();
        bloc.message.clear();
        showSnackBar(RouteUtils.context, " Your Message Sended Succeesfuly");

        log("sending message success  > ${response.data}");
      } else {
        emit(Error());
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
      }
    } catch (e) {
      emit(Error());
      showSnackBar(RouteUtils.context, '"catch an error ==>$e"');
    }
  }
}
