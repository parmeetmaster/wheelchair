import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:wheelchair/model/form/form_model.dart';
import 'package:wheelchair/presentation/widgets/common_space_element.dart';
import 'package:wheelchair/presentation/widgets/common_text_field.dart';
import 'package:wheelchair/presentation/widgets/drop_down_container.dart';
import 'package:wheelchair/presentation/widgets/group_radio_with_title/group_radio_with_title.dart';
import 'package:wheelchair/presentation/widgets/group_radio_with_title/wheelchairQuestion1.dart';
import 'package:wheelchair/presentation/widgets/group_radio_with_title/wheelchairQuestion2.dart';
import 'package:wheelchair/presentation/widgets/image_box.dart';
import 'package:wheelchair/presentation/widgets/text_title.dart';
import 'package:wheelchair/provider/hive_provider.dart';
import 'package:wheelchair/provider/list_of_member_provider/list_of_member_provider.dart';
import 'package:wheelchair/utils/extension.dart';

class FormScreen extends StatefulWidget {
  FormModel? model;

  FormScreen({Key? key, this.model}) : super(key: key);

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

  //
  late final TextEditingController observeNotes;

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

  final generationArr = ["Gen2", "Gen3"];
  final List<String> subGen2Arr = [
    "Gen_2 S (25 CM - 33CM )",
    "Gen_2 M (33 CM - 38CM )",
    "Gen_2 L (38 CM - 43CM )",
    "Gen_2 XL (43 CM - 48CM )"
  ];
  final List<String> subGen3Arr = [
    "Gen_3 S (25 CM - 31CM )",
    "Gen_3 M (31 CM - 36CM )",
    "Gen_3 L (36 CM - 40CM )",
    "Gen_3 XL (40 CM - 47CM )"
  ];

  final List<String> seatLengthArray = [
    "Less than 41 CM SHORTEST",
    "41 CM - 47 CM MIDDLE",
    "Greater than 47 CM LONGEST",
  ];

  final List<String> seatHeightArray = [
    "Greater than 52 CM HIGHEST",
    "48 CM - 52 CM MID-HIGH",
    "44 CM - 48 CM MID-LOW",
    "LESS than 44 CM LOWEST",
  ];

  ListOfMemberController controller = Get.find();

  @override
  void initState() {
    super.initState();

    if (widget.model == null) {
      model = FormModel();
      model.wheelChairQuestion1Model = WheelChairQuestion1Model();
      model.wheelChairQuestion2Model = WheelChairQuestion2Model();
    }
    name = TextEditingController();
    dateOfBirthAndAge = TextEditingController();
    address = TextEditingController();
    phno = TextEditingController();
    careTaker = TextEditingController();
    diagnosis = TextEditingController();
    // ask
    // model.wheelChairQuestion1Model = WheelChairQuestion1Model();
    experenceUsingWheelChair = TextEditingController();
    // observe
    // model.wheelChairQuestion2Model = WheelChairQuestion2Model();
    observeNotes = TextEditingController();
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

    // UPDATE
    if (widget.model != null) {
      model = widget.model!;
      _setUpdateDataFromModel();
    }
  }

  _setUpdateDataFromModel() {
    setState(() {
      name.text = model.clientName ?? "";
      dateOfBirthAndAge.text = model.dateOfBirth ?? "";
      address.text = model.address ?? "";
      phno.text = model.phnoNumber ?? "";
      careTaker.text = model.careTakerName ?? "";
      diagnosis.text = model.diagnosis ?? "";
      experenceUsingWheelChair.text =
          model.askWhatisExperenceUsingWheelChair ?? "";
      observeNotes.text = model.observeNotes ?? "";
      pressureSoreDescription.text = model.PressureSoresDescription ?? "";
      referOut.text = model.recommondatonReferOut ?? "";
      referName.text = model.recommondatonReferName ?? "";
      referOrganisation.text = model.referOrganisation ?? "";
      referOrganisation.text = model.referTodayDate ?? "";
      fitClientName.text = model.fitclientName ?? "";
      fitTodayDate.text = model.fitClientTodayDate ?? "";
      seatWidth.text = model.seatWidth ?? "";
      seatLength.text = model.seatLength ?? "";
      seatHeight.text = model.seatHeight ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    _setSeatWidthGen(model.seatWidthGen, context);
    _setSeatHeightGen(model.seatWidthGen, context);
    _setSeatLengthGen(model.seatWidthGen, context);

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
                controller: phno,
                prefixIcon: Icons.phone,
                type: TextInputType.phone,
                label: 'Phone Number',
                hint: 'Enter your Permanent Address',
                onChange: (s) {},
              ),
              CommonSpaceElement(),
              //care taker
              CommonTextField(
                controller: careTaker,
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
                  controller: observeNotes,
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
                  controller: pressureSoreDescription,
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


              CommonSpaceElement(),
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
              ImageBox(
                asset: "assets/images/img_2.png",
                text: "This image instruct how to determine the width.",
              ),
              CommonTextField(
                  type: TextInputType.number,
                  controller: seatWidth,
                  validator: (s) {
                    if (s.isEmpty) {
                      return false;
                    }
                  },
                  onFieldSubmit: (val) => _setSeatWidthGen(val, context),
                  prefixIcon: Icons.event_seat,
                  label: "Seat Width",
                  hint: "Enter value in CM"),
              CommonSpaceElement(),
              Text(
                "Select Seat Generation (Width)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CommonSpaceElement(
                height: 5,
              ),
              DropDownContainer(
                  hint: "Select Generation",
                  dropDownItem: generationArr,
                  onChanged: (s) {
                    setState(() {
                      model.seatWidthGen = s;
                    });
                  },
                  selectedItem: model.seatWidthGen),
              if (model.seatWidthGen != null) CommonSpaceElement(),
              if (model.seatWidthGen != null)
                Text(
                  "Select Seat Width",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

              CommonSpaceElement(
                height: 5,
              ),
              if (model.seatWidthGen != null)
                DropDownContainer(
                    hint: "Select seat width",
                    dropDownItem: model.seatWidthGen == generationArr[0]
                        ? subGen2Arr
                        : subGen3Arr,
                    onChanged: (s) {
                      setState(() {
                        model.seatWidthGenRange = s;
                      });
                    },
                    selectedItem: model.seatWidthGenRange),
              CommonSpaceElement(
                height: 5,
              ),
              Divider(
                thickness: 2,
                color: Colors.black26,
              ),
              CommonSpaceElement(
                height: 5,
              ),

              ImageBox(
                asset: "assets/images/img_1.png",
                text:"This image instruct how to determine the height.",
              ),

              CommonTextField(
                  onFieldSubmit: (val) => _setSeatHeightGen(val, context),
                  controller: seatHeight,
                  type: TextInputType.number,
                  prefixIcon: Icons.event_seat,
                  label: "Seat Height",
                  hint: "Enter value in CM"),
              CommonSpaceElement(
                height: 5,
              ),
              Text(
                "Select Seat height",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CommonSpaceElement(
                height: 5,
              ),
              DropDownContainer(
                  hint: "Select Height of chair",
                  dropDownItem: seatHeightArray,
                  onChanged: (s) {
                    setState(() {
                      model.seatHeightDropDownCm = s;
                    });
                  },
                  selectedItem: model.seatHeightDropDownCm),

              CommonSpaceElement(
                height: 5,
              ),
              Divider(
                thickness: 2,
                color: Colors.black26,
              ),
              CommonSpaceElement(
                height: 5,
              ),

              ImageBox(
                asset: "assets/images/img.png",
                text: "This image instruct how to determine the height.",
              ),

              CommonTextField(
                  controller: seatLength,
                  type: TextInputType.number,
                  onFieldSubmit: (val) => _setSeatLengthGen(val, context),
                  prefixIcon: Icons.event_seat,
                  label: "Seat length",
                  hint: "Enter value in CM"),
              CommonSpaceElement(),
              Text(
                "Select Seat Length",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CommonSpaceElement(
                height: 5,
              ),
              DropDownContainer(
                  hint: "Select length of chair",
                  dropDownItem: seatLengthArray,
                  onChanged: (s) {
                    setState(() {
                      model.seatLengthDropDownCm = s;
                    });
                  },
                  selectedItem: model.seatLengthDropDownCm),
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
                  model.askWhatisExperenceUsingWheelChair =
                      experenceUsingWheelChair.text;
                  model.observeNotes = observeNotes.text;
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
                  HiveController controller = Get.find();
                  await controller.insert(model);
                  ListOfMemberController listOfMember = Get.find();
                  listOfMember.getExistingData();
                  print("data added");
                  "Record Add Successfully".showSnackbar(context);
                  Future.delayed(Duration(milliseconds: 500), () {
                    Navigator.pop(context);
                  });
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

  void _setSeatWidthGen(String? seatWidthGen, BuildContext context) {
    if (this.seatWidth.text.isEmpty) return;

    if (seatWidthGen == generationArr[0]) {
      int cm;
      try {
        cm = int.parse(seatWidth.text);
      } catch (e) {
        //   "No data inside Width".showSnackbar(context);
        return;
      }

      if (cm <= 25 && cm <= 33) {
        model.seatWidthGenRange = subGen2Arr[0];
      } else if (cm >= 33 && cm <= 38) {
        model.seatWidthGenRange = subGen2Arr[1];
      } else if (cm >= 38 && cm <= 43) {
        model.seatWidthGenRange = subGen2Arr[2];
      } else if (cm >= 43 && cm <= 48) {
        model.seatWidthGenRange = subGen2Arr[3];
      } else if (cm >= 48) {
        model.seatWidthGenRange = subGen2Arr[3]; // same
      }
    } else if (seatWidthGen == generationArr[1]) {
      int cm;
      try {
        cm = int.parse(seatWidth.text);
      } catch (e) {
        //   "No data inside Width".showSnackbar(context);
        return;
      }

      if (cm <= 25 && cm <= 31) {
        model.seatWidthGenRange = subGen3Arr[0];
      } else if (cm >= 31 && cm <= 36) {
        model.seatWidthGenRange = subGen3Arr[1];
      } else if (cm >= 36 && cm <= 40) {
        model.seatWidthGenRange = subGen3Arr[2];
      } else if (cm >= 40 && cm <= 47) {
        model.seatWidthGenRange = subGen3Arr[3];
      } else if (cm >= 47) {
        model.seatWidthGenRange = subGen3Arr[3]; // same
      }
    }
// todo gen 3

    setState(() {});
  }

  void _setSeatHeightGen(String? seatWidthGen, BuildContext context) {
    if (this.seatHeight.text.isEmpty) return;
    int cm;
    try {
      cm = int.parse(seatHeight.text);
    } catch (e) {
      //   "No data inside Width".showSnackbar(context);
      return;
    }
    if (cm > 52) {
      model.seatHeightDropDownCm = seatHeightArray[0];
    } else if (cm >= 48 && cm <= 52) {
      model.seatHeightDropDownCm = seatHeightArray[1];
    } else if (cm >= 44 && cm <= 48) {
      model.seatHeightDropDownCm = seatHeightArray[2];
    } else if (cm < 44) {
      model.seatHeightDropDownCm = seatHeightArray[3];
    }

    setState(() {});
  }

  void _setSeatLengthGen(String? seatWidthGen, BuildContext context) {
    if (this.seatLength.text.isEmpty) return;
    int cm;
    try {
      cm = int.parse(seatLength.text);
    } catch (e) {
      //   "No data inside Width".showSnackbar(context);
      return;
    }

    if (cm < 41) {
      model.seatLengthDropDownCm = seatLengthArray[0];
    } else if (cm >= 41 && cm <= 47) {
      model.seatLengthDropDownCm = seatLengthArray[1];
    } else if (cm > 47) {
      model.seatLengthDropDownCm = seatLengthArray[2];
    }
    setState(() {});
  }
}
