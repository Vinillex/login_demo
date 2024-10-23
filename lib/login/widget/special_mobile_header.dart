import 'package:flutter/widgets.dart';
import 'package:login_ui/login/widget/title_widget.dart';
import 'package:login_ui/util/title_widget_painter.dart';

class SpecialMobileHeader extends StatelessWidget {
  const SpecialMobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            ClipPath(
              clipper: MyCustomClipper(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFB6564),
                      Color(0xFFA03CEA),
                    ],
                  ),
                ),
              ),
            ),
            const TitleWidget(),
          ],
        );
      },
    );
  }
}
