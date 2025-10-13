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
abstract class Sample with _$Sample, FreezedChangeRequestMixin {
  const Sample._();
  const factory Sample({
    required String id,
    required String name,
    required int age,

    /// 3.0より、constでなくともDefaultが使えるようになった
    // @Default(DateTime.now()) DateTime createdAt,
  }) = _Sample;

  // 新しい書き方
  // Sample({required this.id, required this.name, required this.age});

  // final String id;
  // final String name;
  // final int age;

  factory Sample.fromJson(Map<String, dynamic> json) => _$SampleFromJson(json);

  Map<String, dynamic> requestJsonA(Sample original) =>
      requestJson(original: original.toJson(), updated: toJson());
}
