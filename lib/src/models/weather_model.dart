class Weather {
  String? localObservationDateTime;
  int? epochTime;
  String? weatherText;
  int? weatherIcon;
  bool? hasPrecipitation;
  Null precipitationType;
  bool? isDayTime;
  Temperature? temperature;
  String? mobileLink;
  String? link;

  Weather(
      {this.localObservationDateTime,
      this.epochTime,
      this.weatherText,
      this.weatherIcon,
      this.hasPrecipitation,
      this.precipitationType,
      this.isDayTime,
      this.temperature,
      this.mobileLink,
      this.link});

  Weather.fromJson(Map<String, dynamic> json) {
    localObservationDateTime = json['LocalObservationDateTime'];
    epochTime = json['EpochTime'];
    weatherText = json['WeatherText'];
    weatherIcon = json['WeatherIcon'];
    hasPrecipitation = json['HasPrecipitation'];
    precipitationType = json['PrecipitationType'];
    isDayTime = json['IsDayTime'];
    temperature = json['Temperature'] != null
        ? Temperature.fromJson(json['Temperature'])
        : null;
    mobileLink = json['MobileLink'];
    link = json['Link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['LocalObservationDateTime'] = localObservationDateTime;
    data['EpochTime'] = epochTime;
    data['WeatherText'] = weatherText;
    data['WeatherIcon'] = weatherIcon;
    data['HasPrecipitation'] = hasPrecipitation;
    data['PrecipitationType'] = precipitationType;
    data['IsDayTime'] = isDayTime;
    if (temperature != null) {
      data['Temperature'] = temperature!.toJson();
    }
    data['MobileLink'] = mobileLink;
    data['Link'] = link;
    return data;
  }
}

class Temperature {
  Metric? metric;
  Imperial? imperial;

  Temperature({this.metric, this.imperial});

  Temperature.fromJson(Map<String, dynamic> json) {
    metric = json['Metric'] != null ? Metric.fromJson(json['Metric']) : null;
    imperial =
        json['Imperial'] != null ? Imperial.fromJson(json['Imperial']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metric != null) {
      data['Metric'] = metric!.toJson();
    }
    if (imperial != null) {
      data['Imperial'] = imperial!.toJson();
    }
    return data;
  }
}

class Metric {
  dynamic value;
  String? unit;
  int? unitType;

  Metric({this.value, this.unit, this.unitType});

  Metric.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    unit = json['Unit'];
    unitType = json['UnitType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Value'] = value;
    data['Unit'] = unit;
    data['UnitType'] = unitType;
    return data;
  }
}

class Imperial {
  dynamic value;
  String? unit;
  int? unitType;

  Imperial({this.value, this.unit, this.unitType});

  Imperial.fromJson(Map<String, dynamic> json) {
    value = json['Value'];
    unit = json['Unit'];
    unitType = json['UnitType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Value'] = value;
    data['Unit'] = unit;
    data['UnitType'] = unitType;
    return data;
  }
}
