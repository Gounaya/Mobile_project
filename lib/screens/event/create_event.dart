
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:mobileproject/data/models/event.dart';
import 'package:mobileproject/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateEvent extends StatefulWidget {

  Event event;
  Function(Event event) functionEvent;
  CreateEvent({Key key, this.event, this.functionEvent}): super(key: key);

  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  String title = '';
  String createdBy = '';
  String numero = '';
  DateTime dayDate;
  DateTime timeDate;
  int minAge = 18;
  int maxAge = 100;
  String address = '';
  String gender = '';
  String description;

  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;

  final db = Firestore.instance;

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  //final Event event;

  RangeValues values = RangeValues(18, 100);
  RangeLabels labels = RangeLabels('18', '100');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              FormBuilder(
                key: _fbKey,
                initialValue: {
                  'date': DateTime.now(),
                  'accept_terms': false,
                },
                autovalidate: true,
                child: Column(
                  children: <Widget>[

                    FormBuilderTextField(
                      attribute: 'text',
                      validators: [FormBuilderValidators.required()],
                      decoration: textInputDecoration.copyWith(hintText: 'Title', icon: Icon(Icons.title)),
                      onChanged: (val){
                        setState(() =>
                        title = val
                        );
                      },
                    ),
                    SizedBox(height: 10.0),
                    FormBuilderTextField(
                      attribute: 'text',
                      validators: [FormBuilderValidators.required()],
                      decoration: textInputDecoration.copyWith(hintText: 'Created By', icon: Icon(Icons.person)),
                      onChanged: (val){
                        setState(() =>
                        createdBy = val
                        );
                      },
                    ),
                    SizedBox(height: 10.0),

                    FormBuilderTextField(
                      keyboardType: TextInputType.number,
                      decoration: textInputDecoration.copyWith(hintText: 'Phone number', icon: Icon(Icons.phone)),
                      validators: [FormBuilderValidators.required()],
                      //onSaved: (input) => _value = num.tryParse(input),
                      onChanged: (val){
                        setState(() =>
                          numero = val
                        );
                      },
                    ),
                    SizedBox(height: 10.0),


                    FormBuilderDateTimePicker(
                      attribute: "date",
                      inputType: InputType.date,
                      validators: [FormBuilderValidators.required()],
                      format: DateFormat("dd-MM-yyyy"),
                      decoration: textInputDecoration.copyWith(hintText: 'Day of the Date', icon: Icon(Icons.calendar_today)),
                      onChanged: (val){
                        setState(() =>
                          dayDate = val
                        );
                      },
                    ),
                    SizedBox(height: 10.0),

                    FormBuilderDateTimePicker(
                      attribute: "date",
                      inputType: InputType.time,
                      validators: [FormBuilderValidators.required()],
                      format: DateFormat("hh:mm"),
                      decoration: textInputDecoration.copyWith(hintText: 'Time of the Date', icon: Icon(Icons.access_time)),
                      onChanged: (val){
                        setState(() =>
                          timeDate = val
                        );
                      },
                    ),
                    SizedBox(height: 10.0),

                    FormBuilderTextField(
                      attribute: 'text',
                      validators: [FormBuilderValidators.required()],
                      decoration: textInputDecoration.copyWith(hintText: 'Address', icon: Icon(Icons.location_on)),
                      onChanged: (val){
                        setState(() =>
                          address = val
                        );
                      },
                    ),
                    SizedBox(height: 50.0),

                    Align(
                      alignment: Alignment.center,//Alignment(-0.75, 0.0),
                      child: Text("Age ?",
                          style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16)
                          )
                    ),

                    SizedBox(height: 5.0),
                    RangeSlider(
                      min: 18,
                      max: 100,
                      values: values,
                      divisions: 100,
                      labels: labels,
                      onChanged: (value) {
                        print('START: ${value.start}, END: ${value.end}');
                        setState(() {
                          values = value;
                          labels =
                              RangeLabels('${value.start.toInt().toString()}', '${value.end.toInt().toString()}');
                          minAge = value.start.toInt();
                          maxAge = value.end.toInt();
                        });
                      },
                    ),
                    Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text("Age minimum  : "+minAge.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Text("Age Maximum : "+maxAge.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ]),
                    SizedBox(height: 20.0),


                    FormBuilderDropdown(
                      attribute: "gender",
                      decoration: textInputDecoration.copyWith(hintText: 'Gender', icon: Icon(Icons.accessibility_new)),
                      initialValue: 'Female',
                      hint: Text('Select Gender'),
                      validators: [FormBuilderValidators.required()],
                      items: ['Male', 'Female', 'Other']
                          .map((gender) => DropdownMenuItem(
                          value: gender, child: Text("$gender")))
                          .toList(),
                      onChanged: (val){
                        setState(() =>
                          gender = val
                        );
                      },
                    ),
                    SizedBox(height: 10.0),


                    FormBuilderTextField(
                      attribute: 'text',
                      //validators: [FormBuilderValidators.required()],
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      decoration: textInputDecoration.copyWith(hintText: 'Description', icon: Icon(Icons.description)),
                      onChanged: (val){
                        setState(() =>
                          description = val
                        );
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20, top: 20),
                      child: FormBuilderCheckbox(
                        attribute: 'accept_terms',
                        label: Text(
                            "I have read and agree to the terms and conditions"),
                        validators: [
                          FormBuilderValidators.requiredTrue(
                            errorText:
                            "You must accept terms and conditions to continue",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left:100, right: 100),
                child: Row(
                  children: <Widget>[
                    MaterialButton(
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.blue,
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',

                        ),
                      ),
                      onPressed: () async{
                        widget.event= Event(title,
                            createdBy,
                            numero,
                            dayDate,
                            timeDate,
                            address,
                            minAge,
                            maxAge,
                            gender,
                            description
                        );
                        widget.functionEvent(widget.event);
                        await db.collection("events").add(widget.event.toJson());
                      },
                    ),
                    MaterialButton(
                      child: Text("Reset"),
                      onPressed: () {
                        _fbKey.currentState.reset();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
