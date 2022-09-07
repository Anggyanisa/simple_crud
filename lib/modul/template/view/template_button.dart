import 'package:flutter/material.dart';

class TemplateButton extends StatelessWidget {
  var label;
  var color;
  var contentColor;
  var onClick;
  var icon;
  var borderColor;
  var gradient;
  bool bold;
  bool enabled;
  bool expand;
  bool textAlignCenter;
  bool expandText;
  bool useBorder;
  double paddingTopBottom;
  double paddingLeftRight;
  double fontSize;
  double? widthButton;
  double? heightButton;
  double iconSize;
  double radius;
  TemplateButton(
      {this.label,
      this.color = Colors.blue,
      this.onClick,
      this.contentColor = Colors.white,
      this.icon,
      this.fontSize = 14,
      this.paddingTopBottom = 10,
      this.expand = false,
      this.borderColor,
      this.paddingLeftRight = 16,
      this.widthButton,
      this.heightButton,
      this.enabled = true,
      this.iconSize = 16,
      this.bold = false,
      this.gradient,
      this.radius = 12.0,
      this.textAlignCenter = false,
      this.expandText = false,
      this.useBorder=false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled == true ? onClick : null,
      child: Container(
        height: heightButton,
        width: widthButton,
        padding: EdgeInsets.fromLTRB(paddingLeftRight, paddingTopBottom,
            paddingLeftRight, paddingTopBottom),
        decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            border: Border.all(
              width: useBorder?1:0,
              color: enabled == true
                  ? borderColor != null
                      ? borderColor
                      : color == Colors.white
                          ? contentColor
                          : color
                  : Colors.grey[350]!,
            ),
            color: enabled == true ? color : Colors.grey[350]),
        child: Row(
          mainAxisSize: !expand ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            icon != null
                ? Row(
                    children: <Widget>[
                      Icon(
                        icon,
                        color: contentColor,
                        size: iconSize,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  )
                : Container(),
            expandText
                ? Expanded(
                    child: Text(
                    label,
                    style: TextStyle(
                        color: enabled == true ? contentColor : Colors.white,
                        fontSize: fontSize,
                        fontWeight: bold ? FontWeight.bold : FontWeight.normal),
                    textAlign: textAlignCenter ? TextAlign.center : null,
                  ))
                : Text(
                    label,
                    style: TextStyle(
                        color: enabled == true ? contentColor : Colors.white,
                        fontSize: fontSize,
                        fontWeight: bold ? FontWeight.bold : FontWeight.normal),
                    textAlign: textAlignCenter ? TextAlign.center : null,
                  ),
          ],
        ),
      ),
    );
  }
}
