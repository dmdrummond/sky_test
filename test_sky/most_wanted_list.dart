import 'package:sky/framework/animation/scroll_behavior.dart';
import 'package:sky/framework/components/fixed_height_scrollable.dart';
import 'package:sky/framework/fn.dart';
import 'most_wanted_data.dart';
import 'most_wanted_row.dart';

class MostWantedList extends FixedHeightScrollable {
  List<MostWanted> mostWanted;

  MostWantedList({
            this.mostWanted
            }) : super(scrollBehavior: new OverscrollBehavior());

  List<UINode> buildItems(int start, int count) {
    return mostWanted
    .skip(start)
    .take(count)
    .map((mostWanted) => new MostWantedRow(mostWanted: mostWanted))
    .toList(growable: false);
  }
}
