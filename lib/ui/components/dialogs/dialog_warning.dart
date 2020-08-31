import 'package:flutter/material.dart';
import 'package:flutter_template/utils/objects.dart';
import 'package:flutter_template/values/colors.dart';
import 'package:flutter_template/widgets/buttons/default_button.dart';
import 'package:flutter_template/widgets/text.dart';
import 'package:flutter_template/widgets/widgets.dart';

class DialogWarning extends StatelessWidget {
  final String title;
  final String message;
  final Color titleColor;
  final String buttonText;
  final Function function;
  final bool hideButton;

  DialogWarning({this.title, this.message, this.buttonText, this.function, this.titleColor, this.hideButton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(blocks.horizontal(20)))),
        backgroundColor: Colors.white,
        content: Wrap(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: blocks.vertical(title != null ? 30 : 0),
                  bottom: blocks.vertical(30),
                  left: blocks.horizontal(25),
                  right: blocks.horizontal(25)),
              child: Column(
                children: <Widget>[
                  xText(
                      text: title ?? "",
                      color: titleColor ?? ColorsX.textBlack,
                      fontSize: scale.scaledSize(24)),
                  margin(y: 20),
                  Container(
                    width: blocks.getWidth(),
                    child: xText(
                        textAlign: TextAlign.center,
                        text: message,
                        color: ColorsX.textGrey,
                        fontSize: scale.scaledSize(18)),
                  ),
                  margin(y: hideButton == true ? 0:  35),
                  hideButton == true ? Container(): defaultButton(
                    height: blocks.vertical(30),
                    width: blocks.horizontal(131),
                    text: buttonText ?? 'Dismiss',
                    color: ColorsX.accent,
                    onPressed: () {
                      Navigator.pop(context);
                      if(function != null) {
                        function();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}