class CountryModel {
  Data? data;

  CountryModel({this.data});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      // ignore: unnecessary_type_check
      data: json is Map<String, dynamic> ? Data.fromJson(json) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data.addAll(this.data!.toJson());
    }
    return data;
  }
}

class Data {
  String? name;
  String? fullName;
  String? capital;
  String? iso2;
  String? iso3;
  String? currency;
  String? phoneCode;
  String? continent;
  String? description;
  String? size;
  String? independenceDate;
  String? population;
  Href? href;

  Data(
      {this.name,
      this.fullName,
      this.capital,
      this.iso2,
      this.iso3,
      this.currency,
      this.phoneCode,
      this.continent,
      this.description,
      this.size,
      this.independenceDate,
      this.population,
      this.href});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['full_name'];
    capital = json['capital'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    currency = json['currency'];
    phoneCode = json['phone_code'];
    continent = json['continent'];
    description = json['description'];
    size = json['size'];
    independenceDate = json['independence_date'];
    population = json['population'];
    href = json['href'] != null ? Href.fromJson(json['href']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['full_name'] = fullName;
    data['capital'] = capital;
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    data['currency'] = currency;
    data['phone_code'] = phoneCode;
    data['continent'] = continent;
    data['description'] = description;
    data['size'] = size;
    data['independence_date'] = independenceDate;
    data['population'] = population;
    if (href != null) {
      data['href'] = href!.toJson();
    }
    return data;
  }
}

class Href {
  String? self;
  String? states;
  String? presidents;
  String? flag;

  Href({this.self, this.states, this.presidents, this.flag});

  Href.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    states = json['states'];
    presidents = json['presidents'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    data['states'] = states;
    data['presidents'] = presidents;
    data['flag'] = flag;
    return data;
  }
}
