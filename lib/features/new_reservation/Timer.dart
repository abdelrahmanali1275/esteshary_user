class Timer {
  Timer({
    this.doctorId,
    this.active,
    this.from,
    this.to,
    this.date,
    this.day,
  });

  Timer.fromJson(dynamic json) {
    doctorId = json['doctorId'];
    active = json['active'];
    from = json['from'];
    to = json['to'];
    day = json['day'];
    date = json["date"];
  }

  String? doctorId;
  bool? active;
  String? from;
  String? to;
  String? day;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctorId'] = doctorId;
    map['active'] = active;
    map['from'] = from;
    map['to'] = to;
    map['day'] = day;
    map["date"] = date;
    return map;
  }
}
