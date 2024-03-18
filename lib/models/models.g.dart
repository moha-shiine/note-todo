// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotemodelAdapter extends TypeAdapter<Notemodel> {
  @override
  final int typeId = 0;

  @override
  Notemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Notemodel(
      data: (fields[0] as List?)?.cast<Data>(),
      links: fields[1] as Links?,
      meta: fields[2] as Meta?,
    );
  }

  @override
  void write(BinaryWriter writer, Notemodel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.links)
      ..writeByte(2)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DataAdapter extends TypeAdapter<Data> {
  @override
  final int typeId = 1;

  @override
  Data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data(
      id: fields[0] as int?,
      user: fields[1] as User?,
      title: fields[2] as String?,
      description: fields[3] as String?,
      createdAt: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Data obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 2;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as int?,
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LinksAdapter extends TypeAdapter<Links> {
  @override
  final int typeId = 3;

  @override
  Links read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Links(
      first: fields[0] as String?,
      last: fields[1] as String?,
      prev: fields[2] as dynamic,
      next: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Links obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.first)
      ..writeByte(1)
      ..write(obj.last)
      ..writeByte(2)
      ..write(obj.prev)
      ..writeByte(3)
      ..write(obj.next);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MetaAdapter extends TypeAdapter<Meta> {
  @override
  final int typeId = 4;

  @override
  Meta read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Meta(
      currentPage: fields[0] as int?,
      from: fields[1] as int?,
      lastPage: fields[2] as int?,
      links: (fields[3] as List?)?.cast<Links>(),
      path: fields[4] as String?,
      perPage: fields[5] as int?,
      to: fields[6] as int?,
      total: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Meta obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.currentPage)
      ..writeByte(1)
      ..write(obj.from)
      ..writeByte(2)
      ..write(obj.lastPage)
      ..writeByte(3)
      ..write(obj.links)
      ..writeByte(4)
      ..write(obj.path)
      ..writeByte(5)
      ..write(obj.perPage)
      ..writeByte(6)
      ..write(obj.to)
      ..writeByte(7)
      ..write(obj.total);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
