import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef SegementValueChangeCallBack = void Function(int oldValue, int newValue);

class SegementWdiget extends StatelessWidget {
  const SegementWdiget(
      {super.key,
      required this.selected,
      required this.titles,
      this.selectedStyle,
      this.unselectedStyle,
      this.space = 20,
      this.valueWillChange});
  final ValueNotifier<int> selected;
  final List<String> titles;
  final double space;
  final TextStyle? selectedStyle, unselectedStyle;
  final SegementValueChangeCallBack? valueWillChange;

  TextStyle _textStyle(BuildContext context, bool isSelect) {
    final appearance = context.read<Appearance>();
    final style = isSelect ? selectedStyle : unselectedStyle;
    if (style != null) {
      return style;
    }
    return isSelect
        ? TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: appearance.titleColor)
        : TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: appearance.subTitleColor);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: selected,
      builder: (context, _) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < titles.length; i++) ...[
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  valueWillChange?.call(selected.value, i);
                  selected.value = i;
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: (i == 0) ? 0 : space / 2,
                        right: (i == titles.length - 1) ? 0 : space / 2),
                    child: Text(titles[i],
                        style: _textStyle(context, selected.value == i)),
                  ),
                ),
              ),
            ]
          ],
        );
      },
    );
  }
}
