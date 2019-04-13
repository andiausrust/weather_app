import 'package:http/http.dart' show Client;
import '../model/weather_data.dart';

class MapApi {
  static const _apiKey = '548c140b22cf4408fd1c9a83af74c4ab';
  static const _endpoint = 'http://api.openweathermap.org/data/2.5';
  double lat, lon;
  Client client = Client();

  static MapApi _instance;
  static MapApi getInstance() => _instance ??= MapApi();

  String _apiCall({double lat, double lon}) {
    return _endpoint +
        "/weather?lat=" +
        lat.toString() +
        "&lon=" +
        lon.toString() +
        "&APPID=" +
        _apiKey +
        "&units=metric";
  }

  getWeather({double lat, double lon}) async {
    var response = await client.get(
      Uri.encodeFull(_apiCall(lat: lat, lon: lon)),
      headers: {'Accept': 'application/json'},
    );
    print(response.body);
    return WeatherData.deserialize(response.body);
  }
}
