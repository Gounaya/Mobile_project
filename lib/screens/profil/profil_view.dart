
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mobileproject/screens/profil/avatar_widget.dart';
import 'package:mobileproject/services/authservice.dart';
import 'package:mobileproject/shared/loading.dart';
import 'package:mobileproject/shared/provider_auth.dart';
import 'package:mobileproject/data/models/user.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';

class ProfilView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: ProviderAuth.of(context).auth.getCurrentUser(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return displayTheUser(context, snapshot);
              }else{
                return Loading();
              }
            },
          ),

        ],
      ),
    );
  }

  Widget displayTheUser(context, snapshot) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    final user = snapshot.data;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            AvatarWidget(
              onTap: () async {
                await ImagePicker.pickImage(source: ImageSource.gallery);
              },
            ),
          ],
        ),
        Divider(
          height: 100,
        ),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Name :",
                    style: GoogleFonts.raleway(fontSize: 20.0, fontWeight: FontWeight.bold, color: themeChanger.theme.primaryColor,),)
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${user.displayName}", style: GoogleFonts.raleway(fontSize: 20.0, color: themeChanger.theme.primaryColor), )
                ),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Email :", style: GoogleFonts.raleway(fontSize: 20.0, fontWeight: FontWeight.bold, color: themeChanger.theme.primaryColor),)
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${user.email}", style: GoogleFonts.raleway(fontSize: 20.0, color: themeChanger.theme.primaryColor),)
                ),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Creation date :", style: GoogleFonts.raleway(fontSize: 20.0, fontWeight: FontWeight.bold, color: themeChanger.theme.primaryColor),)
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${DateFormat('dd/MM/yyyy').format(user.metadata.creationTime)}", style: GoogleFonts.raleway(fontSize: 20.0,color: themeChanger.theme.primaryColor),)
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  signOutButton(context, snapshot),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget signOutButton(context, snapshot) {

    return MaterialButton(
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text('Sign out',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
      onPressed: ()  async{
        try{
          await ProviderAuth.of(context).auth.signOut();
        }catch(e){
          print(e);
        }
      },
    );
  }
}

Widget myOwnEventWidget() {

}