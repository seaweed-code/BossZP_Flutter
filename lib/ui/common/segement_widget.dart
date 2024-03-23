import 'package:bosszp/model/appearance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

typedef SegementValueChangeCallBack = void Function(int oldValue, int newValue);

class TextStyleTween extends Tween<TextStyle?> {
  TextStyleTween({begin, end}) : super(begin: begin, end: end);

  double lerpDouble(double? a, double? b, double t) {
    if (a != null && b != null) {
      return a! + (b! - a!) * t;
    }

// if(a == null && b)
    return 0;
  }

  @override
  TextStyle lerp(double t) {
    return TextStyle(
      color: Color.lerp(begin?.color, end?.color, t),
      fontSize: lerpDouble(begin?.fontSize, end?.fontSize, t),
      fontWeight: FontWeight.lerp(begin?.fontWeight, end?.fontWeight, t),
    );
  }
}

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

    return style ??
        (isSelect
            ? TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: appearance.titleColor)
            : TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: appearance.subTitleColor));
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
                    child: TweenAnimationBuilder(
                      duration: Duration(milliseconds: 500),
                      tween: TextStyleTween(
                          end: _textStyle(context, selected.value == i)),
                      builder: (context, value, child) {
                        return Text(titles[i], style: value);
                      },
                    ),
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
