import 'package:dio/dio.dart';
import 'package:one_data_taxi_app_task/core/base/result_handle.dart';
import 'package:one_data_taxi_app_task/core/constants/app_constants.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

typedef AddressResult = Result<String>;

class AddressRepository {
  Future<AddressResult> getAddressResult(Point point) async {
    AddressResult result;
    try {
      const String url = 'https://geocode-maps.yandex.ru/1.x/';
      final queryParams = <String, dynamic>{
        'apikey': AppConstants.geoCoderKey,
        'geocode': '${point.longitude},${point.latitude}',
        'lang': 'uz',
        'format': 'json',
        'results': '1'
      };
      final Dio yandexDio = Dio();
      result = await yandexDio.get(url, queryParameters: queryParams).then((response) {
        if (response.statusCode == 200) {
          final position =
              response.data['response']['GeoObjectCollection']['featureMember'][0]['GeoObject'];
          return AddressResult(data: '${position['name']}. ${position['description']}');
        }
        return AddressResult(errorMessage: response.statusCode.toString());
      });
    } catch (e) {
      result = AddressResult(errorMessage: e.toString());
    }
    return result;
  }
}
