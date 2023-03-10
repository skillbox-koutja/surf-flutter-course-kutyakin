import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verify/verify.dart';

part 'field.freezed.dart';

@freezed
class Field<T, E> with _$Field<T, E> {
  bool get isValid => errors.isEmpty;

  const factory Field({
    required T value,
    required Validator<T> validator,
    required BuiltList<E> errors,
    required bool isDirty,
  }) = _Field;

  const Field._();

  factory Field.create({
    required T value,
    required Validator<T> validator,
  }) {
    return Field(
      value: value,
      validator: validator,
      errors: <E>[].toBuiltList(),
      isDirty: false,
    );
  }

  factory Field.fromValidation({
    required T value,
    required Validator<T> validator,
  }) {
    return Field(
      value: value,
      validator: validator,
      errors: validator.errors<E>(value).toBuiltList(),
      isDirty: false,
    );
  }

  Field<T, E> edit(T value) {
    return copyWith(
      value: value,
      errors: validator.errors<E>(value).toBuiltList(),
      isDirty: true,
    );
  }

  Field<T, E> untouchedEdit(T value) {
    return copyWith(
      value: value,
      errors: validator.errors<E>(value).toBuiltList(),
    );
  }

  Field<T, E> touch() {
    return copyWith(
      isDirty: true,
    );
  }

  Field<T, E> validate() {
    return copyWith(
      errors: validator.errors<E>(value).toBuiltList(),
    );
  }

  Field<T, E> save() {
    return copyWith(
      isDirty: false,
    );
  }
}
