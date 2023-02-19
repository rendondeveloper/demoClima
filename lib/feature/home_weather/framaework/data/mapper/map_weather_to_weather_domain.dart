import 'package:weatherdemo/core/utils/base/mapper.dart';import 'package:weatherdemo/feature/home_weather/domain/models_domain/weather_current_domain.dart';import 'package:weatherdemo/feature/home_weather/domain/models_domain/weather_domain.dart';import 'package:weatherdemo/feature/home_weather/domain/models_domain/weather_future_domain.dart';import 'package:weatherdemo/feature/home_weather/framaework/data/config/weather.dart';class MapWeatherToWeatherDomain implements Mapper<Weather, WeatherDomain> {  @override  WeatherDomain map(Weather input) {    WeatherCurrentDomain? weatherCurrentDomain;    if (input.current != null) {      final weatherTemp = input.current?.weather?.isNotEmpty == true ? input.current?.weather?.first : null;      weatherCurrentDomain = WeatherCurrentDomain(weatherTemp?.main ?? "", weatherTemp?.description ?? "", "${input.current?.temp ?? "0"}º");    }    final list = input.daily?.map((day) {          final weatherTemp = day.weatherTemp?.isNotEmpty == true ? day.weatherTemp?.first : null;          return WeatherFutureDomain(weatherTemp?.main ?? "", weatherTemp?.description ?? "", "${day.temp?.min ?? "0"}º", "${day.temp?.max ?? "0"}º");        }).toList() ??        [];    /*final list2 = [      WeatherFutureDomain("Clear", "clear Sky", "68º", "66º"),      WeatherFutureDomain("Clear", "clear Sky", "68º", "66º"),      WeatherFutureDomain("Clear", "clear Sky", "68º", "66º"),      WeatherFutureDomain("Clear", "clear Sky", "68º", "66º"),      WeatherFutureDomain("Clear", "clear Sky", "68º", "66º"),      WeatherFutureDomain("Clear", "clear Sky", "68º", "66º"),      WeatherFutureDomain("Clear", "clear Sky", "68º", "66º")    ];*/    return WeatherDomain(weatherCurrentDomain, list);  }}