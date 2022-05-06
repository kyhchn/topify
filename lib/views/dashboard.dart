import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:topify/assets/colors.dart';
import 'package:topify/views/widgets/HomePage.dart';
import 'package:topify/views/widgets/logoutpage.dart';
import 'package:topify/views/widgets/toptracks.dart';

class Dashboard extends StatefulWidget {
  Dashboard(this._index);
  int _index = 0;
  State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar: FlashyTabBar(
            items: [
              navbarItem(Icon(CupertinoIcons.music_albums ), "Top Tracks"),
              navbarItem(Icon(CupertinoIcons.power), "Log Out")
            ],
            onItemSelected: (index){
              setState(() {
                widget._index = index;
              });
            },
            selectedIndex: widget._index,
          ),
          
          body: SafeArea(
            child: IndexedStack(
              index: widget._index,
              children: [TopTracks(), LogOutPage()],
            ),
          ),
        );
  }
  navbarItem(Icon icon, String tittle){
    return FlashyTabBarItem(icon: icon, title: Text(tittle), activeColor: pastelBrown);
  }
}
