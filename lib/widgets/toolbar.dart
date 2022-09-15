
import 'package:flutter/material.dart';
import 'package:stock_app/candlesticks.dart';
import 'package:stock_app/widgets/toolbar_action.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({
    Key? key,
    required this.onZoomInPressed,
    required this.onZoomOutPressed,
    required this.children,
  }) : super(key: key);

  final void Function() onZoomInPressed;
  final void Function() onZoomOutPressed;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff170312),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            ToolBarAction(
              onPressed: onZoomOutPressed,
              child: Icon(
                Icons.remove,
                color: Theme.of(context).grayColor,
              ),
            ),
            ToolBarAction(
              onPressed: onZoomInPressed,
              child: Icon(
                Icons.add,
                color: Theme.of(context).grayColor,
              ),
            ),
            ...children
          ],
        ),
      ),
    );
  }
}
