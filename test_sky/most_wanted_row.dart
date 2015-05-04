// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:sky/framework/components/ink_well.dart';
import 'package:sky/framework/fn.dart';
import 'package:sky/framework/theme/typography.dart' as typography;
import 'most_wanted_data.dart';

class MostWantedRow extends Component {
  static final Style _style = new Style('''
    display: flex;
    flex-direction: row;
    align-items: center;
    border-bottom: 1px solid #F4F4F4;
    padding-top: 16px;
    padding-left: 16px;
    padding-right: 16px;
    padding-bottom: 20px;'''
  );

  static final Style _tickerStyle = new Style('''
    flex: 1;'''
  );

  static final Style _straplineStyle = new Style('''
    text-align: right;
    padding-right: 16px;'''
  );

  MostWanted mostWanted;

  MostWantedRow({MostWanted mostWanted}) {
    this.mostWanted = mostWanted;
  }

  UINode build() {

    List<UINode> children = [
      new Container(
      key: 'image',
      style: _tickerStyle,
      children: [new Image(width: 64, height: 64, src: mostWanted.image)]
      ),
      new Container(
          key: 'strapline',
          style: _straplineStyle,
          children: [new Text(mostWanted.strapline)]
      )
    ];

    return new StyleNode(new InkWell(children: children), _style);
  }
}
