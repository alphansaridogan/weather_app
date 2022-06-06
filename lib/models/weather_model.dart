
class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? clouds;
  List? iconList;
  String? icon;
  double? wind_kmh;

Weather({
  this.cityName,
  this.temp,
  this.wind,
  this.humidity,
  this.feels_like,
  this.clouds,
  this.iconList,
  this.icon,
  this.wind_kmh,
});
  Weather.fromJson(Map<String, dynamic> json){
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    feels_like= json["main"]["feels_like"];
    clouds = json["clouds"]["all"];
    iconList = json["weather"];
    icon = json["weather"][0]["icon"].toString();
    wind_kmh = wind!*3.6;


  }

}
