import 'package:app_upeu/comp/CustomAppBar.dart';
import 'package:app_upeu/theme/AppTheme.dart';
import 'package:app_upeu/drawer/drawer_user_controller.dart';
import 'package:app_upeu/drawer/home_drawer.dart';
import 'package:app_upeu/ui/help_screen.dart';
import 'package:app_upeu/ui/help_screen.dart';
import 'package:app_upeu/ui/tres_en_raya/tres_main.dart';
import 'package:app_upeu/ui/tres_en_raya/tres_main2.dart';

//import 'package:covidapp/drawer/home_screen.dart';
//import 'package:covidapp/drawer/invite_friend_screen.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    //drawerIndex = DrawerIndex.HOME;
    screenView = MainTresEnRaya();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          //appBar: CustomAppBar(accionx: accion as Function),
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView = MainTresEnRaya(); //MainPersona()
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {});
      } else {
        //do in your way......
      }
    }
  }
}
