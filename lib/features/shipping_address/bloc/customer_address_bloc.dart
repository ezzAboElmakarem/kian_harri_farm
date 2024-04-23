import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/addresses/model/address_model.dart';
import 'package:kian_sheeps_projects/features/addresses/repo/address_repo.dart';

class CustomerAddressBloc extends Bloc<AppEvent, AppState> {
  CustomerAddressBloc() : super(Loading()) {
    on<Get>(_getData);
    // on<Click>(_saveShippingData);
  }
  static CustomerAddressBloc of(context) => BlocProvider.of(context);
  AddressModel addressesData = AddressModel();

  Map<String, dynamic> cachedInfo = {};
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await AddressRepositroy.getAddressData();
      if (response.statusCode == 200) {
        addressesData = AddressModel.fromJson(response.data);
        log('Get Addresses data Successfuly ');
        emit(Done());
        log(addressesData.addresses?[0].id.toString() ?? 'test');
        if (addressesData.addresses!.isEmpty) {
          emit(Empty());
        }
      } else {
        emit(Error());
        log('Get Addresses Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in get Addresses data ${e.toString()}");
    }
  }

//   _saveShippingData(AppEvent event, Emitter<AppState> emit) async {
//     cachedInfo = {
//       "name": nameController.text,
//       "phone": phoneController.text,
//       "secondphone": extraPhoneController.text,
//       "email": emailController.text,
//       "address_id": addressId,
//       "note": notesController.text,
//     };

//     cachedInfo.forEach((key, value) {
//       RouteUtils.navigateTo(const PaymentView());
//       print('$key: $value');
//     });
//   }
}
