import 'package:flutter/material.dart';
import 'package:grade_plus_plus/pages/fragments/BlankPadding.dart';

class IconLabelPair extends Row {
  IconLabelPair({
    Key key,
    @required String label,
    @required IconData icon,
    Color color,
  }) : super(
          key: key,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                children: <Widget>[
                  Icon(icon),
                  const BlankPadding(),
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color == null ? Colors.lightBlue.shade300 : color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
}
