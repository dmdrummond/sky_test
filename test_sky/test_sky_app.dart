// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:sky/framework/components/action_bar.dart';
import 'package:sky/framework/components/icon.dart';
import 'package:sky/framework/components/icon_button.dart';
import 'package:sky/framework/components/input.dart';
import 'package:sky/framework/components/scaffold.dart';
import 'package:sky/framework/debug/tracing.dart';
import 'package:sky/framework/fn.dart';
import 'package:sky/framework/theme/typography.dart' as typography;
import 'package:sky/framework/theme/colors.dart';
import 'most_wanted_data.dart';
import 'most_wanted_list.dart';
import 'package:sky/framework/components/drawer.dart';
import 'package:sky/framework/components/popup_menu.dart';
import 'package:sky/framework/components/drawer_header.dart';
import 'package:sky/framework/components/menu_item.dart';
import 'package:sky/framework/components/menu_divider.dart';
import 'package:sky/framework/components/modal_overlay.dart';


class TestSkyApp extends App {
  DrawerController _drawerController = new DrawerController();

  static final Style _actionBarStyle = new Style('''
    background-color: ${Blue[500]};''');

  static final Style _titleStyle = new Style('''
    ${typography.white.title};''');

  MostWantedDataFetcher _mostWantedDataFetcher;
  List<MostWanted> _mostWantedList = [];

  bool _isShowingMenu = false;


  TestSkyApp() : super() {
    _mostWantedDataFetcher = new MostWantedDataFetcher('http://www.gmp.police.uk/live/nhoodv3.nsf/CreateAppWantedXML?OpenAgent');
  }


  Drawer buildDrawer() {
    return new Drawer(
        controller: _drawerController,
        level: 3,
        children: [
          new DrawerHeader(children: [new Text('Stocks')]),
          new MenuItem(
              key: 'Inbox',
              icon: 'content/inbox',
              children: [new Text('Inbox')]),
          new MenuDivider(),
          new MenuItem(
              key: 'Drafts',
              icon: 'content/drafts',
              children: [new Text('Drafts')]),
          new MenuItem(
              key: 'Settings',
              icon: 'action/settings',
              children: [new Text('Settings')]),
          new MenuItem(
              key: 'Help & Feedback',
              icon: 'action/help',
              children: [new Text('Help & Feedback')])
        ]
    );
  }

  UINode buildActionBar() {
    return new StyleNode(
        new ActionBar(
            left: new IconButton(icon: 'navigation/menu_white', onGestureTap: _drawerController.toggle),
            center: new Container(style: _titleStyle, children: [new Text('UK Election 2015 Candidates')])),
            _actionBarStyle);
  }


  UINode build() {

    return new Scaffold(
        header: buildActionBar(),
        content: new MostWantedList(mostWanted: _mostWantedDataFetcher.fetchData()),
        drawer: buildDrawer()
    );
  }
}