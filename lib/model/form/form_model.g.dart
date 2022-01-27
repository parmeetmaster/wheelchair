// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormModelAdapter extends TypeAdapter<FormModel> {
  @override
  final int typeId = 0;

  @override
  FormModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FormModel(
      wheelChairQuestion1Model: fields[11] as WheelChairQuestion1Model?,
      clientName: fields[0] as String?,
      dateOfBirth: fields[1] as String?,
      age: fields[2] as int?,
      phnoNumber: fields[3] as String?,
      careTakePhoneNumber: fields[4] as String?,
      diagnosis: fields[5] as String?,
      askDoYouHaveMedicalGovernmentCertificate: fields[6] as String?,
      askDoYouCurruntlyHaveWheelChair: fields[7] as String?,
      askWhereWillYouUse: fields[8] as String?,
      askWhatisExperenceUsingWheelChair: fields[9] as String?,
      observeCanClientHoldTheirSafety: fields[10] as String?,
    )..wheelChairQuestion2Model = fields[12] as WheelChairQuestion2Model?;
  }

  @override
  void write(BinaryWriter writer, FormModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.clientName)
      ..writeByte(1)
      ..write(obj.dateOfBirth)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.phnoNumber)
      ..writeByte(4)
      ..write(obj.careTakePhoneNumber)
      ..writeByte(5)
      ..write(obj.diagnosis)
      ..writeByte(6)
      ..write(obj.askDoYouHaveMedicalGovernmentCertificate)
      ..writeByte(7)
      ..write(obj.askDoYouCurruntlyHaveWheelChair)
      ..writeByte(8)
      ..write(obj.askWhereWillYouUse)
      ..writeByte(9)
      ..write(obj.askWhatisExperenceUsingWheelChair)
      ..writeByte(10)
      ..write(obj.observeCanClientHoldTheirSafety)
      ..writeByte(11)
      ..write(obj.wheelChairQuestion1Model)
      ..writeByte(12)
      ..write(obj.wheelChairQuestion2Model);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WheelChairQuestion1ModelAdapter
    extends TypeAdapter<WheelChairQuestion1Model> {
  @override
  final int typeId = 1;

  @override
  WheelChairQuestion1Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WheelChairQuestion1Model(
      home: fields[1] as bool,
      work: fields[2] as bool,
      ruralAreas: fields[3] as bool,
      community: fields[4] as bool,
      publicTransportation: fields[5] as bool,
      other: fields[6] as bool,
      otherReason: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WheelChairQuestion1Model obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.home)
      ..writeByte(2)
      ..write(obj.work)
      ..writeByte(3)
      ..write(obj.ruralAreas)
      ..writeByte(4)
      ..write(obj.community)
      ..writeByte(5)
      ..write(obj.publicTransportation)
      ..writeByte(6)
      ..write(obj.other)
      ..writeByte(7)
      ..write(obj.otherReason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WheelChairQuestion1ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WheelChairQuestion2ModelAdapter
    extends TypeAdapter<WheelChairQuestion2Model> {
  @override
  final int typeId = 2;

  @override
  WheelChairQuestion2Model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WheelChairQuestion2Model(
      indepenent: fields[1] as bool,
      assistance1: fields[2] as bool,
      assistance2: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WheelChairQuestion2Model obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.indepenent)
      ..writeByte(2)
      ..write(obj.assistance1)
      ..writeByte(3)
      ..write(obj.assistance2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WheelChairQuestion2ModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
