import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:wheelchair/model/form/form_model.dart';
import 'package:wheelchair/presentation/widgets/common_space_element.dart';
import 'package:wheelchair/presentation/widgets/common_text_field.dart';
import 'package:wheelchair/presentation/widgets/group_radio_with_title/group_radio_with_title.dart';
import 'package:wheelchair/presentation/widgets/group_radio_with_title/wheelchairQuestion1.dart';
import 'package:wheelchair/presentation/widgets/group_radio_with_title/wheelchairQuestion2.dart';
import 'package:wheelchair/presentation/widgets/text_title.dart';
import 'package:wheelchair/provider/hive_provider.dart';
import 'package:wheelchair/provider/list_of_member_provider/list_of_member_provider.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController name;
  late final TextEditingController dateOfBirthAndAge;
  late final TextEditingController address;
  late final TextEditingController phno;
  late final TextEditingController careTaker;
  late final TextEditingController diagnosis;

  // ask question
  late final TextEditingController experenceUsingWheelChair;

  // pressure shore
  late final TextEditingController pressureSoreDescription;
  late final TextEditingController referOut;
  late final TextEditingController referName;
  late final TextEditingController referOrganisation;
  late final TextEditingController referTodayDate;

  //wheelchair fit form
  late final TextEditingController fitClientName;
  late final TextEditingController fitTodayDate;
  late final TextEditingController seatWidth;
  late final TextEditingController seatLength;
  late final TextEditingController seatHeight;
  late FormModel model;
  ScrollController scrollController = new ScrollController();




  @override
  void initState() {
    super.initState();
    // add code for update as well
    model = FormModel();
    //   _getData();

    name = TextEditingController();
    dateOfBirthAndAge = TextEditingController();
    address = TextEditingController();
    phno = TextEditingController();
    careTaker = TextEditingController();
    diagnosis = TextEditingController();
    // ask
    model.wheelChairQuestion1Model = WheelChairQuestion1Model();
    experenceUsingWheelChair = TextEditingController();
    // observe
    model.wheelChairQuestion2Model = WheelChairQuestion2Model();

    // pressure
    pressureSoreDescription = TextEditingController();
    referOut = TextEditingController();
    referName = TextEditingController();
    referOrganisation = TextEditingController();
    referTodayDate = TextEditingController();
    // fit
    fitClientName = TextEditingController();
    fitTodayDate = TextEditingController();

    seatWidth = TextEditingController();
    seatLength = TextEditingController();
    seatHeight = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill the form"),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          controller: scrollController,
          showTrackOnHover: true,
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 8),
            children: [
              CommonSpaceElement(),
              TextTitle("General Information"),
              CommonSpaceElement(),
              CommonTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (s) {
                  if (s == null || s.isEmpty) {
                    return 'Text is empty';
                  }
                },
                controller: name,
                prefixIcon: Icons.person,
                label: 'Full Name',
                hint: 'First name and last name',
                onChange: (s) {},
              ),
              CommonSpaceElement(),
              //dob
              CommonTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1991, 8),
                      lastDate: DateTime.now());
                  if (picked != null) {
                    dateOfBirthAndAge.text =
                        "${picked.day}/${picked.month}/${picked.year}";
                  }
                },
                readOnly: true,
                controller: dateOfBirthAndAge,
                prefixIcon: Icons.date_range,
                label: 'Date of Birth',
                hint: 'DD/MM/YYYY',
              ),
              CommonSpaceElement(),
              //address
              CommonTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (s) {
                  if (s == null || s.isEmpty) {
                    return 'Text is empty';
                  }
                },
                controller: address,
                prefixIcon: Icons.home,
                label: 'Address',
                hint: 'Enter your Permanent Address',
                onChange: (s) {},
              ),
              CommonSpaceElement(),
              //phno
              CommonTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (s) {
                  if (s == null || s.length < 10) {
                    return '10 digits must required';
                  }
                },
                controller: address,
                prefixIcon: Icons.phone,
                label: 'Phone Number',
                hint: 'Enter your Permanent Address',
                onChange: (s) {},
              ),
              CommonSpaceElement(),
              //care taker
              CommonTextField(
                controller: phno,
                prefixIcon: Icons.wheelchair_pickup_sharp,
                label: 'Care Taker Name',
                hint: 'Enter your Permanent Address',
                onChange: (s) {},
              ),
              CommonSpaceElement(),
              // Physical Condition and consideration
              TextTitle("Physical Condition and consideration"),
              CommonSpaceElement(),
              // diagnosis
              CommonTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: diagnosis,
                prefixIcon: Icons.build,
                label: 'Diagnois',
                hint: '',
                onChange: (s) {},
              ),
              CommonSpaceElement(),
              TextTitle("Ask Questions"),
              CommonSpaceElement(),
              //Do you have Medical or Goverment Certificate
              GroupRadioTitle(
                title: "Do you have Medical or Goverment Certificate",
                value1: "Yes",
                value2: "No",
                groupvalue: model.askDoYouHaveMedicalGovernmentCertificate,
                onChanged1: (s) {},
                onChanged2: (s2) {},
                onUpdate: (str) {
                  setState(() {
                    model.askDoYouHaveMedicalGovernmentCertificate = str;
                  });
                },
              ),
              //Do you curruntly have WheelChair?
              GroupRadioTitle(
                title: "Do you curruntly have WheelChair?",
                value1: "Yes",
                value2: "No",
                groupvalue: model.askDoYouCurruntlyHaveWheelChair,
                onChanged1: (s) {},
                onChanged2: (s2) {},
                onUpdate: (str) {
                  setState(() {
                    model.askDoYouCurruntlyHaveWheelChair = str;
                  });
                },
              ),
              CommonSpaceElement(),
              WheelChairQuestion1(
                model: model.wheelChairQuestion1Model!,
                onUpdate: (object) {},
              ),
              CommonTextField(
                  controller: experenceUsingWheelChair,
                  prefixIcon: Icons.school_rounded,
                  label: "Experence Using Wheel Chair",
                  hint: "Write Description below"),

              // onserve
              CommonSpaceElement(),
              TextTitle("Observe"),
              GroupRadioTitle(
                title: "Can client hold their head up safely?",
                value1: "Yes",
                value2: "No",
                groupvalue: model.observeCanClientHoldTheirSafety,
                onChanged1: (s) {},
                onChanged2: (s2) {},
                onUpdate: (str) {
                  setState(() {
                    model.observeCanClientHoldTheirSafety = str;
                  });
                },
              ),
              GroupRadioTitle(
                title: "Can client sit up safely?",
                value1: "Yes",
                value2: "No",
                groupvalue: model.observeCanClientsitUpSafely,
                onChanged1: (s) {},
                onChanged2: (s2) {},
                onUpdate: (str) {
                  setState(() {
                    model.observeCanClientsitUpSafely = str;
                  });
                },
              ),
              WheelChairQuestion2(
                model: model.wheelChairQuestion2Model!,
                onUpdate: (object) {},
              ),

              CommonTextField(
                  controller: experenceUsingWheelChair,
                  prefixIcon: Icons.file_copy,
                  label: "Notes",
                  maxLines: 2,
                  hint: "Write notes below"),

// Pressure sores / skin
              CommonSpaceElement(),
              TextTitle("Pressure Sores/Skin"),
              CommonSpaceElement(),
              GroupRadioTitle(
                title: "Does the person have pressure sores?",
                value1: "Yes",
                value2: "No",
                groupvalue: model.doesPersonHavePressureSoresDescription,
                onChanged1: (s) {},
                onChanged2: (s2) {},
                onUpdate: (str) {
                  setState(() {
                    model.doesPersonHavePressureSoresDescription = str;
                  });
                },
              ),
              GroupRadioTitle(
                title: "Does the person have a history pressure sores?",
                value1: "Yes",
                value2: "No",
                groupvalue: model.doesPersonHaveHistoryPressureSores,
                onChanged1: (s) {},
                onChanged2: (s2) {},
                onUpdate: (str) {
                  setState(() {
                    model.doesPersonHaveHistoryPressureSores = str;
                  });
                },
              ),
              CommonTextField(
                  controller: experenceUsingWheelChair,
                  prefixIcon: Icons.file_copy,
                  label: "If yes describe below",
                  maxLines: 2,
                  hint: ""),

// recommandation and prescription
              CommonSpaceElement(),
              TextTitle("Recommondation & Prescription"),
              GroupRadioTitle(
                title: "",
                value1: "GEN_2",
                value2: "GEN_3",
                groupvalue: model.recommondatonGen,
                onChanged1: (s) {},
                onChanged2: (s2) {},
                onUpdate: (str) {
                  setState(() {
                    model.recommondatonGen = str;
                  });
                },
              ),
              CommonTextField(
                  controller: referOut,
                  prefixIcon: Icons.monetization_on_outlined,
                  label: "Refer Out",
                  hint: "Enter Reference"),
              CommonSpaceElement(),
              CommonTextField(
                  controller: referName,
                  prefixIcon: Icons.person,
                  label: "Refer Name",
                  hint: "Enter Name"),
              CommonSpaceElement(),
              CommonTextField(
                  controller: referOrganisation,
                  prefixIcon: Icons.home_work_rounded,
                  label: "Organisation",
                  hint: "Enter organisation Name"),
              CommonSpaceElement(),
              CommonTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1991, 8),
                      lastDate: DateTime.now());
                  if (picked != null) {
                    referTodayDate.text =
                        "${picked.day}/${picked.month}/${picked.year}";
                  }
                },
                readOnly: true,
                controller: referTodayDate,
                prefixIcon: Icons.date_range,
                label: 'Today Date',
                hint: 'DD/MM/YYYY',
              ),
              CommonSpaceElement(),
              TextTitle("Wheelchair fit form"),
              CommonTextField(
                  controller: fitClientName,
                  prefixIcon: Icons.person,
                  label: "Client Name",
                  hint: "Enter Reference"),
              CommonSpaceElement(),
              CommonTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1991, 8),
                      lastDate: DateTime.now());
                  if (picked != null) {
                    fitTodayDate.text =
                        "${picked.day}/${picked.month}/${picked.year}";
                  }
                },
                readOnly: true,
                controller: fitTodayDate,
                prefixIcon: Icons.date_range,
                label: 'Today Date',
                hint: 'DD/MM/YYYY',
              ),

              CommonSpaceElement(),
              CommonTextField(
                  controller: seatWidth,
                  prefixIcon: Icons.event_seat,
                  label: "Seat Width",
                  hint: "Enter value in CM"),
              CommonSpaceElement(),
              CommonTextField(
                  controller: seatHeight,
                  prefixIcon: Icons.event_seat,
                  label: "Seat Height",
                  hint: "Enter value in CM"),
              CommonSpaceElement(),
              CommonTextField(
                  controller: seatLength,
                  prefixIcon: Icons.event_seat,
                  label: "Seat length",
                  hint: "Enter value in CM"),
              CommonSpaceElement(),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate() == false) {
                    return;
                  }
                  model.clientName = name.text;
                  model.dateOfBirth = dateOfBirthAndAge.text;
                  model.address = address.text;
                  model.phnoNumber = phno.text;
                  model.careTakerName = careTaker.text;
                  model.diagnosis = diagnosis.text;
                  model.askWhatisExperenceUsingWheelChair = experenceUsingWheelChair.text;
                  model.PressureSoresDescription = pressureSoreDescription.text;
                  model.recommondatonReferOut = referOut.text;
                  model.recommondatonReferName = referName.text;
                  model.referOrganisation = referOrganisation.text;
                  model.referTodayDate = referOrganisation.text;
                  model.fitclientName = fitClientName.text;
                  model.fitClientTodayDate = fitTodayDate.text;
                  model.seatWidth = seatWidth.text;
                  model.seatLength = seatLength.text;
                  model.seatHeight = seatHeight.text;
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )),
                ),
              ),
              CommonSpaceElement(),
              CommonSpaceElement(),
            ],
          ),
        ),
      ),
    );
  }
}
