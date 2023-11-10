class Location {
  int? version;
  String? key;
  String? type;
  int? rank;
  String? localizedName;
  Country? country;
  Country? administrativeArea;

  Location(
      {this.version,
        this.key,
        this.type,
        this.rank,
        this.localizedName,
        this.country,
        this.administrativeArea});

  Location.fromJson(Map<String, dynamic> json) {
    version = json['Version'];
    key = json['Key'];
    type = json['Type'];
    rank = json['Rank'];
    localizedName = json['LocalizedName'];
    country =
    json['Country'] != null ? Country.fromJson(json['Country']) : null;
    administrativeArea = json['AdministrativeArea'] != null
        ? Country.fromJson(json['AdministrativeArea'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Version'] = version;
    data['Key'] = key;
    data['Type'] = type;
    data['Rank'] = rank;
    data['LocalizedName'] = localizedName;
    if (country != null) {
      data['Country'] = country!.toJson();
    }
    if (administrativeArea != null) {
      data['AdministrativeArea'] = administrativeArea!.toJson();
    }
    return data;
  }
}

class Country {
  String? iD;
  String? localizedName;

  Country({this.iD, this.localizedName});

  Country.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    localizedName = json['LocalizedName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['ID'] = iD;
    data['LocalizedName'] = localizedName;
    return data;
  }
}
