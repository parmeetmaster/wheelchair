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
      clientName: fields[0] as String?,
      dateOfBirth: fields[1] as String?,
      phnoNumber: fields[3] as String?,
      careTakerName: fields[4] as String?,
      diagnosis: fields[5] as String?,
      askDoYouHaveMedicalGovernmentCertificate: fields[6] as String?,
      askDoYouCurruntlyHaveWheelChair: fields[7] as String?,
      askWhereWillYouUse: fields[8] as String?,
      askWhatisExperenceUsingWheelChair: fields[9] as String?,
      observeCanClientHoldTheirSafety: fields[10] as String?,
      wheelChairQuestion1Model: fields[11] as WheelChairQuestion1Model?,
      wheelChairQuestion2Model: fields[12] as WheelChairQuestion2Model?,
      observeCanClientsitUpSafely: fields[13] as String?,
      observeNotes: fields[14] as String?,
      doesPersonHavePressureSoresDescription: fields[15] as String?,
      doesPersonHaveHistoryPressureSores: fields[16] as String?,
      PressureSoresDescription: fields[17] as String?,
      recommondatonGen: fields[18] as String?,
      recommondatonReferOut: fields[19] as String?,
      recommondatonReferName: fields[20] as String?,
      referOrganisation: fields[21] as String?,
      referTodayDate: fields[22] as String?,
      fitclientName: fields[23] as String?,
      fitClientTodayDate: fields[24] as String?,
      seatWidth: fields[25] as String?,
      seatHeight: fields[26] as String?,
      seatLength: fields[27] as String?,
    )..address = fields[28] as String?;
  }

  @override
  void write(BinaryWriter writer, FormModel obj) {
    writer
      ..writeByte(28)
      ..writeByte(0)
      ..write(obj.clientName)
      ..writeByte(1)
      ..write(obj.dateOfBirth)
      ..writeByte(28)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.phnoNumber)
      ..writeByte(4)
      ..write(obj.careTakerName)
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
      ..write(obj.wheelChairQuestion2Model)
      ..writeByte(13)
      ..write(obj.observeCanClientsitUpSafely)
      ..writeByte(14)
      ..write(obj.observeNotes)
      ..writeByte(15)
      ..write(obj.doesPersonHavePressureSoresDescription)
      ..writeByte(16)
      ..write(obj.doesPersonHaveHistoryPressureSores)
      ..writeByte(17)
      ..write(obj.PressureSoresDescription)
      ..writeByte(18)
      ..write(obj.recommondatonGen)
      ..writeByte(19)
      ..write(obj.recommondatonReferOut)
      ..writeByte(20)
      ..write(obj.recommondatonReferName)
      ..writeByte(21)
      ..write(obj.referOrganisation)
      ..writeByte(22)
      ..write(obj.referTodayDate)
      ..writeByte(23)
      ..write(obj.fitclientName)
      ..writeByte(24)
      ..write(obj.fitClientTodayDate)
      ..writeByte(25)
      ..write(obj.seatWidth)
      ..writeByte(26)
      ..write(obj.seatHeight)
      ..writeByte(27)
      ..write(obj.seatLength);
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
