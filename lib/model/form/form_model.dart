import 'package:hive/hive.dart';

part 'form_model.g.dart';

@HiveType(typeId: 0)
class FormModel extends HiveObject {
  @HiveField(0)
  String? clientName;

  @HiveField(1)
  String? dateOfBirth;

  @HiveField(2)
  int? age;

  @HiveField(3)
  String? phnoNumber;

  @HiveField(4)
  String? careTakePhoneNumber;

  @HiveField(5)
  String? diagnosis;

  @HiveField(6)
  String? askDoYouHaveMedicalGovernmentCertificate;

  @HiveField(7)
  String? askDoYouCurruntlyHaveWheelChair;

  @HiveField(8)
  String? askWhereWillYouUse;

  @HiveField(9)
  String? askWhatisExperenceUsingWheelChair;

  @HiveField(10)
  String? observeCanClientHoldTheirSafety;

  @HiveField(11)
  WheelChairQuestion1Model? wheelChairQuestion1Model;

  @HiveField(12)
  WheelChairQuestion2Model? wheelChairQuestion2Model;

  FormModel(
      {this.wheelChairQuestion1Model,
      this.clientName,
      this.dateOfBirth,
      this.age,
      this.phnoNumber,
      this.careTakePhoneNumber,
      this.diagnosis,
      this.askDoYouHaveMedicalGovernmentCertificate,
      this.askDoYouCurruntlyHaveWheelChair,
      this.askWhereWillYouUse,
      this.askWhatisExperenceUsingWheelChair,
      this.observeCanClientHoldTheirSafety});
}

@HiveType(typeId: 1)
class WheelChairQuestion1Model{
  @HiveField(1)
  bool home;
  @HiveField(2)
  bool work;
  @HiveField(3)
  bool ruralAreas;
  @HiveField(4)
  bool community;
  @HiveField(5)
  bool publicTransportation;
  @HiveField(6)
  bool other;
  @HiveField(7)
  String otherReason;

  WheelChairQuestion1Model(
      {this.home=false,
      this.work=false,
      this.ruralAreas=false,
      this.community=false,
      this.publicTransportation=false,
      this.other=false,
      this.otherReason=""});
}

@HiveType(typeId: 2)
class WheelChairQuestion2Model{
  @HiveField(1)
  bool indepenent;
  @HiveField(2)
  bool assistance1;
  @HiveField(3)
  bool assistance2;


  WheelChairQuestion2Model(
      {this.indepenent=false,
        this.assistance1=false,
        this.assistance2=false,
     });
}

