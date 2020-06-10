
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:mobileproject/data/models/event.dart';
import 'package:mobileproject/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobileproject/shared/provider_auth.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';


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
  DateTime dayDate = DateTime.now();
  DateTime timeDate = DateTime.now();
  int minAge = 18;
  int maxAge = 100;
  String city= '';
  String address = '';
  String gender = 'Female';
  String description;

  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;


  final db = Firestore.instance;

  static final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  //final Event event;

  RangeValues values = RangeValues(18, 100);
  RangeLabels labels = RangeLabels('18', '100');

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      backgroundColor: themeChanger.theme.canvasColor,

      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),

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
                      style: TextStyle(
                        color: themeChanger.theme.primaryColor,
                      ),
                      attribute: 'text',
                      validators: [FormBuilderValidators.required()],
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Title',
                          hintStyle: TextStyle(color: themeChanger.theme.indicatorColor),
                          icon: Icon(Icons.title, color: themeChanger.theme.indicatorColor,),
                          fillColor: Colors.white
                      ),
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
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Created By',
                        hintStyle: TextStyle(color: themeChanger.theme.indicatorColor),
                        icon: Icon(Icons.person, color: themeChanger.theme.indicatorColor,),
                      ),
                      onChanged: (val){
                        setState(() =>
                        createdBy = val
                        );
                      },
                    ),
                    SizedBox(height: 10.0),

                    FormBuilderTextField(
                      keyboardType: TextInputType.number,
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Phone number',
                        hintStyle: TextStyle(color: themeChanger.theme.indicatorColor),
                        icon: Icon(Icons.phone, color: themeChanger.theme.indicatorColor,),
                      ),
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
                      format: DateFormat("dd-MM-yyyy",),
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Day of the Date',
                        hintStyle: TextStyle(color: themeChanger.theme.indicatorColor),
                        icon: Icon(Icons.calendar_today, color: themeChanger.theme.indicatorColor,),
                      ),
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
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Time of the Date',
                          hintStyle: TextStyle(color: themeChanger.theme.indicatorColor),
                          icon: Icon(Icons.access_time, color: themeChanger.theme.indicatorColor)
                      ),
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
                      decoration: textInputDecoration.copyWith(
                          hintText: 'City',
                          hintStyle: TextStyle(color: themeChanger.theme.indicatorColor),
                          icon: Icon(Icons.location_city, color: themeChanger.theme.indicatorColor)
                      ),
                      onChanged: (val){
                        setState(() =>
                          city = val
                        );
                      },
                    ),
                    SizedBox(height: 10.0),

                    FormBuilderTextField(
                      attribute: 'text',
                      validators: [FormBuilderValidators.required()],
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Address',
                          hintStyle: TextStyle(color: themeChanger.theme.indicatorColor),
                          icon: Icon(Icons.location_on, color: themeChanger.theme.indicatorColor)
                      ),
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
                          color: themeChanger.theme.indicatorColor,
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
                        child: Text("Age minimum  : "+minAge.toString(), style: TextStyle(fontWeight: FontWeight.bold,/* color: themeChanger.theme.primaryColor*/),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text("Age Maximum : "+maxAge.toString(), style: TextStyle(fontWeight: FontWeight.bold, /*color: themeChanger.theme.primaryColor*/),),
                      ),
                    ]),
                    SizedBox(height: 20.0),


                    new Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: themeChanger.theme.backgroundColor==Colors.black12? Colors.black:Colors.white70
                      ),

                      child: FormBuilderDropdown(
                        underline: SizedBox(),
                        attribute: "gender",
                        decoration: textInputDecoration.copyWith(
                            hintText: 'Gender',
                            icon: Icon(Icons.accessibility_new, color: themeChanger.theme.indicatorColor),
                            hintStyle: TextStyle(color: themeChanger.theme.indicatorColor),
                        ),
                        initialValue: 'Female',
                        hint: Text('Select Gender'),
                        validators: [FormBuilderValidators.required()],
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                            value: gender, child: Text("$gender", style: TextStyle(color: themeChanger.theme.primaryColor),),))
                            .toList(),
                        onChanged: (val){
                          setState(() =>
                            gender = val
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),


                    FormBuilderTextField(
                      attribute: 'text',
                      //validators: [FormBuilderValidators.required()],
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      decoration: textInputDecoration.copyWith(
                          hintText: 'Description',
                          hintStyle: TextStyle(color: themeChanger.theme.indicatorColor),
                          icon: Icon(Icons.description, color: themeChanger.theme.indicatorColor)
                      ),
                      onChanged: (val){
                        setState(() =>
                          description = val
                        );
                      },
                    ),
                    SizedBox(height: 10.0),


                    Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 20, top: 20),
                      child: FormBuilderCheckbox(
                        attribute: 'accept_terms',
                        label: Text(
                            "I have read and agree to the terms and conditions", style: TextStyle(color: themeChanger.theme.indicatorColor),),
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
                padding: EdgeInsets.only(top: 15.0, bottom: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
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
                        if(_fbKey.currentState.validate()){
                          widget.event= Event(title,
                              createdBy,
                              numero,
                              dayDate,
                              timeDate,
                              city,
                              address,
                              minAge,
                              maxAge,
                              gender,
                              description
                          );
                          widget.functionEvent(widget.event);

                          //save event to firebase
                          final uid = await ProviderAuth.of(context).auth.getCurrentUID();
                          // To track events create by each user
                          await db.collection("userEvents").document(uid).collection("events").add(widget.event.toJson());
                          // To display all events
                          await db.collection("events").add(widget.event.toJson());
                          //Navigator.of(context).popUntil((route) => route.isFirst);
                          Navigator.of(context).pushReplacementNamed('/home');
                        }
                      },
                    ),
                    MaterialButton(
                      child: Text("Reset", style: TextStyle(color: themeChanger.theme.primaryColor),),
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
