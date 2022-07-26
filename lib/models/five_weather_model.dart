class FiveWeatherModel {
  dynamic cod;
  dynamic message;
  dynamic cnt;
  List<Lis>? list;
  City? city;

  FiveWeatherModel({this.cod, this.message, this.cnt, this.list, this.city});

  FiveWeatherModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <Lis>[];
      json['list'].forEach((v) {
        list!.add(Lis.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class Lis {
  dynamic dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  dynamic visibility;
  dynamic pop;
  Sys? sys;
  dynamic dtTxt;
  Rain? rain;

  Lis(
      {this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.sys,
        this.dtTxt,
        this.rain});

  Lis.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather =  <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds =
    json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['visibility'] = visibility;
    data['pop'] = pop;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['dt_txt'] = dtTxt;
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    return data;
  }
}

class Main {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  dynamic pressure;
  dynamic seaLevel;
  dynamic grndLevel;
  dynamic humidity;
  dynamic tempKf;

  Main(
      {this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.seaLevel,
        this.grndLevel,
        this.humidity,
        this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    data['humidity'] = humidity;
    data['temp_kf'] = tempKf;
    return data;
  }
}

class Weather {
  dynamic id;
  dynamic main;
  dynamic description;
  dynamic icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Clouds {
  dynamic all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class Wind {
  dynamic speed;
  dynamic deg;
  dynamic gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}

class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pod'] = pod;
    return data;
  }
}

class Rain {
  dynamic d3h;

  Rain({this.d3h});

  Rain.fromJson(Map<String, dynamic> json) {
    d3h = json['3h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3h'] = d3h;
    return data;
  }
}

class City {
  dynamic id;
  String? name;
  Coord? coord;
  String? country;
  dynamic population;
  dynamic timezone;
  dynamic sunrise;
  dynamic sunset;

  City(
      {this.id,
        this.name,
        this.coord,
        this.country,
        this.population,
        this.timezone,
        this.sunrise,
        this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}

class Coord {
  dynamic lat;
  dynamic lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}











/*
class FiveWeatherModel {
  String? cod;
  int? message;
  int? cnt;
  List<Lis>? list;
  City? city;

  FiveWeatherModel({this.cod, this.message, this.cnt, this.list, this.city});

  FiveWeatherModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message =(json['message']);
    cnt = (json['cnt']);
    if (json['list'] != null) {
      list = <Lis>[];
      json['list'].forEach((v) {
        list!.add(Lis.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class Lis {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  double? visibility;
  double? pop;
  Sys? sys;
  String? dtTxt;
  Rain? rain;

  Lis(
      {this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.sys,
        this.dtTxt,
        this.rain});

  Lis.fromJson(Map<String, dynamic> json) {
    dt = (json['dt']);
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    clouds =
    json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    visibility =(json['visibility']);
    pop = double.parse(json['pop']);
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
    rain = json['rain'] != null ? Rain.fromJson(json['rain']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      data['clouds'] = clouds!.toJson();
    }
    if (wind != null) {
      data['wind'] = wind!.toJson();
    }
    data['visibility'] = visibility;
    data['pop'] = pop;
    if (sys != null) {
      data['sys'] = sys!.toJson();
    }
    data['dt_txt'] = dtTxt;
    if (rain != null) {
      data['rain'] = rain!.toJson();
    }
    return data;
  }
}

class Main {
  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  double? pressure;
  double? seaLevel;
  double? grndLevel;
  double? humidity;
  double? tempKf;

  Main(
      {this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.seaLevel,
        this.grndLevel,
        this.humidity,
        this.tempKf});

  Main.fromJson(Map<String, dynamic> json) {
    temp =double.parse(json['temp']);
    feelsLike =(json['feels_like']);
    tempMin = (json['temp_min']);
    tempMax = (json['temp_max']);
    pressure = (json['pressure']);
    seaLevel = (json['sea_level']);
    grndLevel = (json['grnd_level']);
    humidity = (json['humidity']);
    tempKf =(json['temp_kf']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['sea_level'] = seaLevel;
    data['grnd_level'] = grndLevel;
    data['humidity'] = humidity;
    data['temp_kf'] = tempKf;
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = (json['id']);
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Clouds {
  int? all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = ( json['all']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    return data;
  }
}

class Wind {
  double? speed;
  double? deg;
  double? gust;

  Wind({this.speed, this.deg, this.gust});

  Wind.fromJson(Map<String, dynamic> json) {
    speed =(json['speed']);
    deg = (json['deg']);
    gust =(json['gust']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    return data;
  }
}

class Sys {
  String? pod;

  Sys({this.pod});

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pod'] = pod;
    return data;
  }
}

class Rain {
  double? d3h;

  Rain({this.d3h});

  Rain.fromJson(Map<String, dynamic> json) {
    d3h =( json['3h']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['3h'] = d3h;
    return data;
  }
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  double? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  City(
      {this.id,
        this.name,
        this.coord,
        this.country,
        this.population,
        this.timezone,
        this.sunrise,
        this.sunset});

  City.fromJson(Map<String, dynamic> json) {
    id =( json['id']);
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population =(json['population']);
    timezone = (json['timezone']);
    sunrise =(json['sunrise']);
    sunset =(json['sunset']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    return data;
  }
}

class Coord {
  double? lat;
  double? lon;

  Coord({this.lat, this.lon});

  Coord.fromJson(Map<String, dynamic> json) {
    lat =double.parse(json['lat']);
    lon =double.parse(json['lon']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}
*/