// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SampleImpl _$$SampleImplFromJson(Map<String, dynamic> json) => _$SampleImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
    );

Map<String, dynamic> _$$SampleImplToJson(_$SampleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
    };
