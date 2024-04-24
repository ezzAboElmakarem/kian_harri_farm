import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/addresses/model/address_model.dart';
import 'package:kian_sheeps_projects/features/addresses/repo/address_repo.dart';

class AddressesBloc extends Bloc<AppEvent, AppState> {
  AddressesBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static AddressesBloc of(context) => BlocProvider.of(context);
  AddressesModel addressesData = AddressesModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await AddressRepositroy.getAddressData();
      if (response.statusCode == 200) {
        addressesData = AddressesModel.fromJson(response.data);
        log('Get Addresses data Successfuly ');
        emit(Done());
        // log(addressesData.addresses?[0].id.toString() ?? 'zxcvbnm,.');
        if (addressesData.addresses!.isEmpty) {
          emit(Empty());
        }
      } else {
        if ("${response.data['message']}" == "Unauthenticated.") {
          emit(Unauthorized());
        } else {
          emit(Error());
          log('Get Addresses Failed with Status code ${response.statusCode}');
        }
      }
    } catch (e) {
      emit(Error());
      log("catch error in get Addresses data ${e.toString()}");
    }
  }
}
