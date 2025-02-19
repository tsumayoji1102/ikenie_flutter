import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample.freezed.dart';
part 'sample.g.dart';

@freezed
class Sample with _$Sample {
  const factory Sample({
    required String id,
    required String name,
    required int age,
  }) = _Sample;

  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);
}
