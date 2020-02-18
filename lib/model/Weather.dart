class Weather {
  final String location;
  final String weatherDescription;
  final String icon;

  final double temperature;

  final DateTime date;

  Weather(
      {this.date,
      this.location,
      this.temperature,
      this.weatherDescription,
      this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weatherDescription: json['weather'][0]['main'],
      icon: json['weather'][0]['icon'],
      date: new DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000,
          isUtc: false),
    );
  }
}
