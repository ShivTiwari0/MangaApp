// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_webtoon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveWebtoonModelAdapter extends TypeAdapter<HiveWebtoonModel> {
  @override
  final int typeId = 0;

  @override
  HiveWebtoonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveWebtoonModel(
      id: fields[0] as String?,
      title: fields[1] as String?,
      thumbnail: fields[2] as String?,
      summary: fields[3] as String?,
      genres: (fields[4] as List?)?.cast<String>(),
      totalChapters: fields[5] as int?,
      isFavorite: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveWebtoonModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.summary)
      ..writeByte(4)
      ..write(obj.genres)
      ..writeByte(5)
      ..write(obj.totalChapters)
      ..writeByte(6)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveWebtoonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
