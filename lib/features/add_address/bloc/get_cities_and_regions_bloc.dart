import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kian_sheeps_projects/core/app_event.dart';
import 'package:kian_sheeps_projects/core/app_state.dart';
import 'package:kian_sheeps_projects/features/add_address/repo/add_address_repo.dart';
import 'package:kian_sheeps_projects/features/add_address/views/model/cities_and_regions_model.dart';

class CitiesAndRegionsBloc extends Bloc<AppEvent, AppState> {
  CitiesAndRegionsBloc() : super(Loading()) {
    on<Get>(_getCitiesData);
    on<Read>(_getRegionsData);
  }
  static CitiesAndRegionsBloc of(context) => BlocProvider.of(context);
  CitiesAndRegionsModel citiesData = CitiesAndRegionsModel();

  CitiesAndRegionsModel regionsData = CitiesAndRegionsModel();

  _getCitiesData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await AddAddressRepository.getCities();
      if (response.statusCode == 200) {
        citiesData = CitiesAndRegionsModel.fromJson(response.data);
        log('Get cities Successfuly ');
        emit(Done());
      } else {
        if ("${response.data['message']}" == "Unauthenticated.") {
          emit(Empty());
        } else {
          emit(Error());
          log('Get cities Failed with Status code ${response.statusCode}');
        }
      }
    } catch (e) {
      emit(Error());
      log("catch error in cities data ${e.toString()}");
    }
  }

  _getRegionsData(AppEvent event, Emitter<AppState> emit) async {
    try {
      // Convert the list of IDs to a single ID
      String cityId =
          (event.arguments as List).map((e) => e.toString()).join(',');

      Response response = await AddAddressRepository.getRegions(
        cityId: cityId,
      );
      if (response.statusCode == 200) {
        regionsData = CitiesAndRegionsModel.fromJson(response.data);
        log('Get regions Successfuly ');
        emit(Done());
      } else {
        if ("${response.data['message']}" == "Unauthenticated.") {
          emit(Empty());
        } else {
          emit(Error());
          log('Get regions Failed with Status code ${response.statusCode}');
        }
      }
    } catch (e) {
      emit(Error());
      log("catch error in regions data ${e.toString()}");
    }
  }
}
