import 'package:flutter/material.dart';
import 'package:mobileproject/theme/theme_changer.dart';
import 'package:provider/provider.dart';

class AvatarWidget extends StatelessWidget {
  final String avatarUrl;
  final Function onTap;

  const AvatarWidget({this.avatarUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    //final themeChanger = Provider.of<ThemeChanger>(context);

    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: avatarUrl == null
            ? CircleAvatar(
          //backgroundColor: themeChanger.theme.accentColor,
          radius: 50.0,
          child: Icon(Icons.photo_camera),
        )
            : CircleAvatar(
          radius: 50.0,
          backgroundImage: NetworkImage(avatarUrl),
        ),
      ),
    );
  }
}