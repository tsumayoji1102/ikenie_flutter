// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sample _$SampleFromJson(Map<String, dynamic> json) => _Sample(
  id: json['id'] as String,
  name: json['name'] as String,
  age: (json['age'] as num).toInt(),
);

Map<String, dynamic> _$SampleToJson(_Sample instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'age': instance.age,
};
