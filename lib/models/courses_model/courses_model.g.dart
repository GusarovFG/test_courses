// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoursesAdapter extends TypeAdapter<Courses> {
  @override
  final int typeId = 0;

  @override
  Courses read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Courses(
      courses: (fields[0] as List).cast<Course>(),
    );
  }

  @override
  void write(BinaryWriter writer, Courses obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.courses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoursesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
