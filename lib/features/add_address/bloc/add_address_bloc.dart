// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/add_address/repo/add_address_repo.dart';
import 'package:kian_sheeps_projects/features/addresses/bloc/addresses_bloc.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:kian_sheeps_projects/helper/show_snack_bar.dart';

class AddAddressBloc extends Bloc<AppEvent, AppState> {
  AddAddressBloc() : super(Start()) {
    on<Click>(_addAddress);
  }
  static AddAddressBloc of(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressDetailsController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController buildingNumberController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  String? cityId;
  String? countryId;

  // TextEditingController locationController = TextEditingController();

  _addAddress(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> body = {
      "name": nameController.text,
      "phone": phoneController.text,
      "address_details": addressDetailsController.text,
      "neighborhood": neighborhoodController.text,
      "street_name": streetNameController.text,
      "building_number": buildingNumberController.text,
      "notes": notesController.text,
      "lat": "23.885942",
      "lng": "45.079162",
      "city_id": cityId,
      "country_id": countryId,
    };
    try {
      Response response = await AddAddressRepository.addAddress(body: body);
      if (response.statusCode == 200 || response.statusCode == 422) {
        log('Posted Address data Successfuly ');
        emit(Done());
        // if (addressesData.data!.isEmpty) {
        //   emit(Empty());
        // }

        AddressesBloc.of(RouteUtils.context).add(Get());
        RouteUtils.pop();
      } else {
        log("Error add address ${response.statusCode}");
        showSnackBar(RouteUtils.context, " ${response.data['message']}");
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part  add address: $e");

      showSnackBar(RouteUtils.context, "catch an error ==>$e");
    }
  }
}
