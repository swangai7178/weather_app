class ForeCast {
  ForeCast({
    required this.location,
    required this.current,
    required this.forecast,
  });
  late final Location location;
  late final Current current;
  late final Forecast forecast;
  
  ForeCast.fromJson(Map<String, dynamic> json){
    location = Location.fromJson(json['location']);
    current = Current.fromJson(json['current']);
    forecast = Forecast.fromJson(json['forecast']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['location'] = location.toJson();
    _data['current'] = current.toJson();
    _data['forecast'] = forecast.toJson();
    return _data;
  }
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });
  late final String name;
  late final String region;
  late final String country;
  late final double lat;
  late final double lon;
  late final String tzId;
  late final int localtimeEpoch;
  late final String localtime;
  
  Location.fromJson(Map<String, dynamic> json){
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['region'] = region;
    _data['country'] = country;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['tz_id'] = tzId;
    _data['localtime_epoch'] = localtimeEpoch;
    _data['localtime'] = localtime;
    return _data;
  }
}

class Current {
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });
  late final int lastUpdatedEpoch;
  late final String lastUpdated;
  late final double tempC;
  late final double tempF;
  late final int isDay;
  late final Condition condition;
  late final double windMph;
  late final double windKph;
  late final int windDegree;
  late final String windDir;
  late final double pressureMb;
  late final double pressureIn;
  late final double precipMm;
  late final double precipIn;
  late final int humidity;
  late final int cloud;
  late final double feelslikeC;
  late final double feelslikeF;
  late final double windchillC;
  late final double windchillF;
  late final double heatindexC;
  late final double heatindexF;
  late final double dewpointC;
  late final double dewpointF;
  late final double visKm;
  late final double visMiles;
  late final double uv;
  late final double gustMph;
  late final double gustKph;
  
  Current.fromJson(Map<String, dynamic> json){
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['last_updated_epoch'] = lastUpdatedEpoch;
    _data['last_updated'] = lastUpdated;
    _data['temp_c'] = tempC;
    _data['temp_f'] = tempF;
    _data['is_day'] = isDay;
    _data['condition'] = condition.toJson();
    _data['wind_mph'] = windMph;
    _data['wind_kph'] = windKph;
    _data['wind_degree'] = windDegree;
    _data['wind_dir'] = windDir;
    _data['pressure_mb'] = pressureMb;
    _data['pressure_in'] = pressureIn;
    _data['precip_mm'] = precipMm;
    _data['precip_in'] = precipIn;
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['feelslike_f'] = feelslikeF;
    _data['windchill_c'] = windchillC;
    _data['windchill_f'] = windchillF;
    _data['heatindex_c'] = heatindexC;
    _data['heatindex_f'] = heatindexF;
    _data['dewpoint_c'] = dewpointC;
    _data['dewpoint_f'] = dewpointF;
    _data['vis_km'] = visKm;
    _data['vis_miles'] = visMiles;
    _data['uv'] = uv;
    _data['gust_mph'] = gustMph;
    _data['gust_kph'] = gustKph;
    return _data;
  }
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });
  late final String text;
  late final String icon;
  late final int code;
  
  Condition.fromJson(Map<String, dynamic> json){
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['text'] = text;
    _data['icon'] = icon;
    _data['code'] = code;
    return _data;
  }
}

class Forecast {
  Forecast({
    required this.forecastday,
  });
  late final List<Forecastday> forecastday;
  
  Forecast.fromJson(Map<String, dynamic> json){
    forecastday = List.from(json['forecastday']).map((e)=>Forecastday.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['forecastday'] = forecastday.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Forecastday {
  Forecastday({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });
  late final String date;
  late final int dateEpoch;
  late final Day day;
  late final Astro astro;
  late final List<Hour> hour;
  
  Forecastday.fromJson(Map<String, dynamic> json){
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = Day.fromJson(json['day']);
    astro = Astro.fromJson(json['astro']);
    hour = List.from(json['hour']).map((e)=>Hour.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['date'] = date;
    _data['date_epoch'] = dateEpoch;
    _data['day'] = day.toJson();
    _data['astro'] = astro.toJson();
    _data['hour'] = hour.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Day {
  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });
  late final double maxtempC;
  late final double maxtempF;
  late final double mintempC;
  late final double mintempF;
  late final double avgtempC;
  late final double avgtempF;
  late final double maxwindMph;
  late final double maxwindKph;
  late final double totalprecipMm;
  late final double totalprecipIn;
  late final double totalsnowCm;
  late final double avgvisKm;
  late final double avgvisMiles;
  late final int avghumidity;
  late final int dailyWillItRain;
  late final int dailyChanceOfRain;
  late final int dailyWillItSnow;
  late final int dailyChanceOfSnow;
  late final Condition condition;
  late final double uv;
  
  Day.fromJson(Map<String, dynamic> json){
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    totalsnowCm = json['totalsnow_cm'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = Condition.fromJson(json['condition']);
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['maxtemp_c'] = maxtempC;
    _data['maxtemp_f'] = maxtempF;
    _data['mintemp_c'] = mintempC;
    _data['mintemp_f'] = mintempF;
    _data['avgtemp_c'] = avgtempC;
    _data['avgtemp_f'] = avgtempF;
    _data['maxwind_mph'] = maxwindMph;
    _data['maxwind_kph'] = maxwindKph;
    _data['totalprecip_mm'] = totalprecipMm;
    _data['totalprecip_in'] = totalprecipIn;
    _data['totalsnow_cm'] = totalsnowCm;
    _data['avgvis_km'] = avgvisKm;
    _data['avgvis_miles'] = avgvisMiles;
    _data['avghumidity'] = avghumidity;
    _data['daily_will_it_rain'] = dailyWillItRain;
    _data['daily_chance_of_rain'] = dailyChanceOfRain;
    _data['daily_will_it_snow'] = dailyWillItSnow;
    _data['daily_chance_of_snow'] = dailyChanceOfSnow;
    _data['condition'] = condition.toJson();
    _data['uv'] = uv;
    return _data;
  }
}

class Astro {
  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
  });
  late final String sunrise;
  late final String sunset;
  late final String moonrise;
  late final String moonset;
  late final String moonPhase;
  late final int moonIllumination;
  late final int isMoonUp;
  late final int isSunUp;
  
  Astro.fromJson(Map<String, dynamic> json){
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['moonrise'] = moonrise;
    _data['moonset'] = moonset;
    _data['moon_phase'] = moonPhase;
    _data['moon_illumination'] = moonIllumination;
    _data['is_moon_up'] = isMoonUp;
    _data['is_sun_up'] = isSunUp;
    return _data;
  }
}

class Hour {
  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.snowCm,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });
  late final int timeEpoch;
  late final String time;
  late final double? tempC;
  late final double? tempF;
  late final int isDay;
  late final Condition condition;
  late final double? windMph;
  late final double? windKph;
  late final int windDegree;
  late final String windDir;
  late final double pressureMb;
  late final double? pressureIn;
  late final double? precipMm;
  late final double? precipIn;
  late final double snowCm;
  late final int humidity;
  late final int cloud;
  late final double? feelslikeC;
  late final double? feelslikeF;
  late final double? windchillC;
  late final double? windchillF;
  late final double? heatindexC;
  late final double? heatindexF;
  late final double? dewpointC;
  late final double? dewpointF;
  late final int willItRain;
  late final int chanceOfRain;
  late final int willItSnow;
  late final int chanceOfSnow;
  late final double visKm;
  late final double visMiles;
  late final double? gustMph;
  late final double? gustKph;
  late final double uv;
  
  Hour.fromJson(Map<String, dynamic> json){
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = Condition.fromJson(json['condition']);
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    snowCm = json['snow_cm'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    willItRain = json['will_it_rain'];
    chanceOfRain = json['chance_of_rain'];
    willItSnow = json['will_it_snow'];
    chanceOfSnow = json['chance_of_snow'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
    uv = json['uv'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['time_epoch'] = timeEpoch;
    _data['time'] = time;
    _data['temp_c'] = tempC;
    _data['temp_f'] = tempF;
    _data['is_day'] = isDay;
    _data['condition'] = condition.toJson();
    _data['wind_mph'] = windMph;
    _data['wind_kph'] = windKph;
    _data['wind_degree'] = windDegree;
    _data['wind_dir'] = windDir;
    _data['pressure_mb'] = pressureMb;
    _data['pressure_in'] = pressureIn;
    _data['precip_mm'] = precipMm;
    _data['precip_in'] = precipIn;
    _data['snow_cm'] = snowCm;
    _data['humidity'] = humidity;
    _data['cloud'] = cloud;
    _data['feelslike_c'] = feelslikeC;
    _data['feelslike_f'] = feelslikeF;
    _data['windchill_c'] = windchillC;
    _data['windchill_f'] = windchillF;
    _data['heatindex_c'] = heatindexC;
    _data['heatindex_f'] = heatindexF;
    _data['dewpoint_c'] = dewpointC;
    _data['dewpoint_f'] = dewpointF;
    _data['will_it_rain'] = willItRain;
    _data['chance_of_rain'] = chanceOfRain;
    _data['will_it_snow'] = willItSnow;
    _data['chance_of_snow'] = chanceOfSnow;
    _data['vis_km'] = visKm;
    _data['vis_miles'] = visMiles;
    _data['gust_mph'] = gustMph;
    _data['gust_kph'] = gustKph;
    _data['uv'] = uv;
    return _data;
  }
}