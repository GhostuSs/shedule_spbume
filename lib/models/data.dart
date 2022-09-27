import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class Shedule extends HiveObject {
  Shedule({this.days});
  @HiveField(1)
  List<Day>? days;

  factory Shedule.fromJson(Map<String, dynamic> json) =>
      _$SheduleFromJson(json);

  Map<String, dynamic> toJson() => _$SheduleToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 2)
class Day extends HiveObject {
  Day({this.day, this.subjects});
  @HiveField(1)
  int? day;
  @HiveField(2)
  List<Subject>? subjects;

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 3)
class Subject extends HiveObject {
  Subject({
    this.endTime,
    this.num,
    this.startTime,
    this.auditory,
    this.name,
    this.type,
    this.lector
  });
  @HiveField(1)
  int? num;
  @HiveField(2)
  String? startTime;
  @HiveField(3)
  String? endTime;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? type;
  @HiveField(6)
  String? auditory;
  @HiveField(7)
  String? lector;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
