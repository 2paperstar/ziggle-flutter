import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ziggle/gen/strings.g.dart';

part 'translate_model.freezed.dart';
part 'translate_model.g.dart';

@freezed
class TranslateModel with _$TranslateModel {
  const factory TranslateModel({
    required String text,
    required AppLocale targetLang,
  }) = _TranslateModel;

  factory TranslateModel.fromJson(Map<String, dynamic> json) =>
      _$TranslateModelFromJson(json);
}
