// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WordAdapter extends TypeAdapter<Word> {
  @override
  final int typeId = 0;

  @override
  Word read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Word(
      pron: (fields[0] as List).cast<String>(),
      bn: fields[1] as String,
      en: fields[2] as String,
      bnSyns: (fields[3] as List).cast<String>(),
      enSyns: (fields[4] as List).cast<String>(),
      sents: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Word obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.pron)
      ..writeByte(1)
      ..write(obj.bn)
      ..writeByte(2)
      ..write(obj.en)
      ..writeByte(3)
      ..write(obj.bnSyns)
      ..writeByte(4)
      ..write(obj.enSyns)
      ..writeByte(5)
      ..write(obj.sents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FavouriteWordAdapter extends TypeAdapter<FavouriteWord> {
  @override
  final int typeId = 1;

  @override
  FavouriteWord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteWord(
      pron: (fields[0] as List).cast<String>(),
      bn: fields[1] as String,
      en: fields[2] as String,
      bnSyns: (fields[3] as List).cast<String>(),
      enSyns: (fields[4] as List).cast<String>(),
      sents: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteWord obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.pron)
      ..writeByte(1)
      ..write(obj.bn)
      ..writeByte(2)
      ..write(obj.en)
      ..writeByte(3)
      ..write(obj.bnSyns)
      ..writeByte(4)
      ..write(obj.enSyns)
      ..writeByte(5)
      ..write(obj.sents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteWordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
