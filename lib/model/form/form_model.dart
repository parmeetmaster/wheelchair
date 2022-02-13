import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_model.g.dart';



@HiveType(typeId: 1)
class WheelChairQuestion1Model {
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
      {this.home = false,
        this.work = false,
        this.ruralAreas = false,
        this.community = false,
        this.publicTransportation = false,
        this.other = false,
        this.otherReason = ""});
}



@HiveType(typeId: 2)
class WheelChairQuestion2Model {
  @HiveField(1)
  bool indepenent;
  @HiveField(2)
  bool assistance1;
  @HiveField(3)
  bool assistance2;

  WheelChairQuestion2Model({
    this.indepenent = false,
    this.assistance1 = false,
    this.assistance2 = false,
  });
}



@HiveType(typeId: 0)
class FormModel extends HiveObject {
  @HiveField(0)
  String? clientName;

  @HiveField(1)
  String? dateOfBirth;

  @HiveField(28)
  String? address;

 /* @HiveField(2)
  int? age;*/

  @HiveField(3)
  String? phnoNumber;

  @HiveField(4)
  String? careTakerName;

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

  @HiveField(13)
  String? observeCanClientsitUpSafely;

  @HiveField(14)
  String? observeNotes;

  // person sores
  @HiveField(15)
  String? doesPersonHavePressureSoresDescription;

  @HiveField(16)
  String? doesPersonHaveHistoryPressureSores;

  @HiveField(17)
  String? PressureSoresDescription;

  // recommondation
  @HiveField(18)
  String? recommondatonGen;

  @HiveField(19)
  String? recommondatonReferOut;

  @HiveField(20)
  String? recommondatonReferName;

  @HiveField(21)
  String? referOrganisation;

  @HiveField(22)
  String? referTodayDate;

  // wheel chair fit form
  @HiveField(23)
  String? fitclientName;

  @HiveField(24)
  String? fitClientTodayDate;

  @HiveField(25)
  String? seatWidth;

  @HiveField(26)
  String? seatHeight;

  @HiveField(27)
  String? seatLength;

  @HiveField(34)
  String? seatHeightDropDownCm;

  @HiveField(29)
  String? seatWidthGen;

  @HiveField(30)
  String? seatWidthGenRange;

  @HiveField(31)
  String? seatLengthDropDownCm;

  @HiveField(32)
  String? seatLengthPosition;

  @HiveField(33)
  String? seatHeightPosition;


}

