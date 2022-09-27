// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SheduleAdapter extends TypeAdapter<Shedule> {
  @override
  final int typeId = 1;

  @override
  Shedule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Shedule(
      days: (fields[1] as List?)?.cast<Day>(),
    );
  }

  @override
  void write(BinaryWriter writer, Shedule obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.days);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SheduleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DayAdapter extends TypeAdapter<Day> {
  @override
  final int typeId = 2;

  @override
  Day read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Day(
      day: fields[1] as int?,
      subjects: (fields[2] as List?)?.cast<Subject>(),
    );
  }

  @override
  void write(BinaryWriter writer, Day obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.subjects);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubjectAdapter extends TypeAdapter<Subject> {
  @override
  final int typeId = 3;

  @override
  Subject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Subject(
      endTime: fields[3] as String?,
      num: fields[1] as int?,
      startTime: fields[2] as String?,
    )
      ..name = fields[4] as String?
      ..type = fields[5] as String?
      ..auditory = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, Subject obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.num)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.endTime)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.auditory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shedule _$SheduleFromJson(Map<String, dynamic> json) => Shedule(
      days: (json['days'] as List<dynamic>?)
          ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SheduleToJson(Shedule instance) => <String, dynamic>{
      'days': instance.days,
    };

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      day: json['day'] as int?,
      subjects: (json['subjects'] as List<dynamic>?)
          ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'day': instance.day,
      'subjects': instance.subjects,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      endTime: json['endTime'] as String?,
      num: json['num'] as int?,
      startTime: json['startTime'] as String?,
    )
      ..name = json['name'] as String?
      ..type = json['type'] as String?
      ..auditory = json['auditory'] as String?;

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'num': instance.num,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'name': instance.name,
      'type': instance.type,
      'auditory': instance.auditory,
    };
