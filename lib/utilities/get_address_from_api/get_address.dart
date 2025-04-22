import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:service_partner/models/city_list.dart';
import 'package:service_partner/models/district_list.dart';
import 'package:service_partner/models/state_list.dart';
import 'package:service_partner/utilities/api_urls.dart';
import 'package:service_partner/utilities/handle_https_response.dart';

class GetAddress {

  GetAddress._();

  static final GetAddress _instance = GetAddress._();

  factory GetAddress() {
    return _instance;
  }

 Future<List<StateList>> getStateList(BuildContext context) async{

    try {
      var uri = Uri.https(Urls.base_url,Urls.get_state_list);

      var response = await get(uri, headers: {
        'Content-Type': 'application/json',
      });

      // Check status code
      if (response.statusCode == 200) {
        var rawData = json.decode(response.body);
        bool isSuccess = rawData['isScuss']??false;
        if(isSuccess){
          List<dynamic> statesData = rawData['data'];
          return statesData
              .map((value) => StateList.fromJson(value as Map<String, dynamic>))
              .toList();
        }
      } else {
        await handleHttpResponse(context, response);
      }
    } catch (exception, trace) {
      print('Exception: $exception, Trace: $trace');
    }
    return [];
  }



  Future<DistrictList> getDistrictList(BuildContext context,String stateName)async{

    try {
      var uri = Uri.https(Urls.base_url,Urls.get_district_list,{'stat':stateName});

      var response = await get(uri, headers: {
        'Content-Type': 'application/json',
      });

      // Check status code
      if (response.statusCode == 200) {
        var rawData = json.decode(response.body);
        bool isSuccess = rawData['isScuss']??false;
        if(isSuccess){
          var districtData = rawData['data'][0] as Map<String, dynamic>;
          return  DistrictList.fromJson(districtData);
        }
      } else {
        await handleHttpResponse(context, response);
      }
    } catch (exception, trace) {
      print('Exception: $exception, Trace: $trace');
    }
    return DistrictList.fromJson(
        {});
  }


  Future<CityList> getCityList(BuildContext context,String distrName)async{
    try {
      var uri = Uri.https(Urls.base_url,Urls.get_city_list,{'distr':distrName});

      var response = await get(uri, headers: {
        'Content-Type': 'application/json',
      });

      // Check status code
      if (response.statusCode == 200) {
        var rawData = json.decode(response.body);
        bool isSuccess = rawData['isScuss']??false;
        if(isSuccess){
          var cityData = rawData['data'][0] as Map<String, dynamic>;
          return CityList.fromJson(cityData);
        }
      } else {
        await handleHttpResponse(context, response);
      }
    } catch (exception, trace) {
      print('Exception: $exception, Trace: $trace');
    }
    return  CityList.fromJson(
        {});
  }

}
