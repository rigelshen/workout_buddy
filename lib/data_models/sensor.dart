class Sensor {
  final double data;
  final double data2;
  //final double any;
  Sensor({this.data , this.data2});
  //Sensor({this.data, this.any});

  //keep this, just converts to double type
  factory Sensor.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Sensor(data: parser(json['data']), data2: parser(json['data1']));
  }
}
