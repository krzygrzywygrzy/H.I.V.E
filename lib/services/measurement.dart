class Measurement {
  //DateTime time;
  int temperature, weight, humidity, pressure, pm25, pm10;

  Measurement(
      { //this.time,
      this.temperature,
      this.weight,
      this.humidity,
      this.pressure,
      this.pm25,
      this.pm10});

  Measurement.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'].floor(),
        weight = json['weight'].floor(),
        humidity = json['humidity'].floor(),
        pressure = json['pressure'].floor(),
        pm25 = json['pm25'].floor(),
        pm10 = json['pm10'].floor();
}
