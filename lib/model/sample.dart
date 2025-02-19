import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample.freezed.dart';
part 'sample.g.dart';

mixin FreezedChangeRequestMixin {
  Map<String, dynamic> requestJson({
    required Map<String, dynamic> original,
    required Map<String, dynamic> updated,
  }) {
    final result = <String, dynamic>{};
    for (final key in updated.keys) {
      if (original[key] != updated[key]) {
        result[key] = updated[key];
      }
    }
    return result;
  }
}

@freezed
class Sample with _$Sample, FreezedChangeRequestMixin {
  const Sample._();
  const factory Sample({
    required String id,
    required String name,
    required int age,
  }) = _Sample;

  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);

  Map<String, dynamic> requestJsonA(Sample original) => requestJson(
        original: original.toJson(),
        updated: toJson(),
      );
}
