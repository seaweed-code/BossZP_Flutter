import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
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
      builder: (context, child) {
        return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          for (int i = 0; i < titles.length; i++) ...[
            GestureDetector(
              onTap: () {
                valueWillChange?.call(selected.value, i);
                selected.value = i;
              },
              child: Text(titles[i],
                  style: _textStyle(context, selected.value == i)),
            ),
            if (i < titles.length - 1) child!,
          ]
        ]);
      },
      child: SizedBox(width: space),
    );
  }
}
