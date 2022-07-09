// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tasks_data_freezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TasksObject {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TasksObjectCopyWith<TasksObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TasksObjectCopyWith<$Res> {
  factory $TasksObjectCopyWith(
          TasksObject value, $Res Function(TasksObject) then) =
      _$TasksObjectCopyWithImpl<$Res>;
  $Res call({int id, String title, String date, String time, int status});
}

/// @nodoc
class _$TasksObjectCopyWithImpl<$Res> implements $TasksObjectCopyWith<$Res> {
  _$TasksObjectCopyWithImpl(this._value, this._then);

  final TasksObject _value;
  // ignore: unused_field
  final $Res Function(TasksObject) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_TasksObjectCopyWith<$Res>
    implements $TasksObjectCopyWith<$Res> {
  factory _$$_TasksObjectCopyWith(
          _$_TasksObject value, $Res Function(_$_TasksObject) then) =
      __$$_TasksObjectCopyWithImpl<$Res>;
  @override
  $Res call({int id, String title, String date, String time, int status});
}

/// @nodoc
class __$$_TasksObjectCopyWithImpl<$Res> extends _$TasksObjectCopyWithImpl<$Res>
    implements _$$_TasksObjectCopyWith<$Res> {
  __$$_TasksObjectCopyWithImpl(
      _$_TasksObject _value, $Res Function(_$_TasksObject) _then)
      : super(_value, (v) => _then(v as _$_TasksObject));

  @override
  _$_TasksObject get _value => super._value as _$_TasksObject;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_TasksObject(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TasksObject implements _TasksObject {
  _$_TasksObject(this.id, this.title, this.date, this.time, this.status);

  @override
  final int id;
  @override
  final String title;
  @override
  final String date;
  @override
  final String time;
  @override
  final int status;

  @override
  String toString() {
    return 'TasksObject(id: $id, title: $title, date: $date, time: $time, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TasksObject &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_TasksObjectCopyWith<_$_TasksObject> get copyWith =>
      __$$_TasksObjectCopyWithImpl<_$_TasksObject>(this, _$identity);
}

abstract class _TasksObject implements TasksObject {
  factory _TasksObject(final int id, final String title, final String date,
      final String time, final int status) = _$_TasksObject;

  @override
  int get id;
  @override
  String get title;
  @override
  String get date;
  @override
  String get time;
  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$_TasksObjectCopyWith<_$_TasksObject> get copyWith =>
      throw _privateConstructorUsedError;
}
