import 'package:flutter/material.dart';

class TemplateForm extends StatefulWidget {
  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final String? titleText;
  // ignore: prefer_typing_uninitialized_variables
  var color;
  var borderColor;
  var fillColor;
  var focusedBorderColor;
  var initialValue;
  var hintStyle;
  var contentPadding;
  final double? titlePaddingBottom;
  final double? fontSize;
  final double? formHeight;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  var formatter;
  final bool enabled;
  final bool adaValidasi;
  final bool keyboardNumber;
  final bool numberOnly;
  final double bottomMargin;
  final double? radius;
  final int maxLine;
  final int minLine;
  final double letterSpacing;
  var prefixIcon;
  var buttonEnd;
  var inputFormatters;
  var fontWeight;
  var enabledBorder;
  var focusedBorder;
  final bool centerText;
  final bool readOnly;

  TemplateForm(
      {this.fieldKey,
      this.hintText,
      this.helperText,
      this.labelText,
      this.onSaved,
      this.validator,
      this.controller,
      this.enabled = true,
      this.adaValidasi = false,
      this.keyboardNumber = false,
      this.numberOnly = false,
      this.titleText,
      this.textCapitalization = TextCapitalization.words,
      this.bottomMargin = 12.0,
      this.maxLine = 1,
      this.initialValue,
      this.prefixIcon,
      this.color = Colors.white,
      this.fontSize = 14,
      this.radius = 16,
      this.formHeight = 48,
      this.minLine = 1,
      this.formatter,
      this.buttonEnd,
      this.borderColor = Colors.white,
      this.focusedBorderColor = Colors.white,
      this.fillColor = Colors.transparent,
      this.hintStyle,
      this.contentPadding,
      this.titlePaddingBottom = 8.0,
      this.inputFormatters,
      this.fontWeight,
      this.letterSpacing = 0,
      this.centerText = false,
      this.readOnly = false,
      this.enabledBorder,
      this.focusedBorder});
  @override
  _TemplateFormState createState() => _TemplateFormState();
}

class _TemplateFormState extends State<TemplateForm> {
  String? _validate(String? value) {
    if (value!.isEmpty) return 'Silahkan isi form ini';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.bottomMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.titleText != null
              ? Padding(
                  padding: EdgeInsets.only(bottom: widget.titlePaddingBottom!),
                  child: Text(
                    widget.titleText!,
                    style: TextStyle(
                        color: widget.color,
                        fontWeight: FontWeight.w600,
                        fontSize: widget.fontSize),
                  ),
                )
              : Container(),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget.readOnly,
                  textAlign:
                      widget.centerText ? TextAlign.center : TextAlign.start,
                  inputFormatters: widget.inputFormatters,
                  minLines: widget.minLine,
                  initialValue: widget.initialValue,
                  cursorColor: widget.color,
                  maxLines: widget.maxLine,
                  controller: widget.controller,
                  keyboardType: widget.keyboardNumber
                      ? TextInputType.number
                      : TextInputType.text,
                  key: widget.fieldKey,
                  enabled: widget.enabled,
                  style: TextStyle(
                      fontSize: widget.fontSize,
                      color: widget.color,
                      fontWeight: widget.fontWeight,
                      letterSpacing: widget.letterSpacing),
                  decoration: InputDecoration(
                      enabledBorder: widget.enabledBorder ??
                          UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(widget.radius!),
                            borderSide: BorderSide(
                              color: widget.borderColor,
                              width: 0.8,
                            ),
                          ),
                      focusedBorder: widget.focusedBorder ??
                          UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(widget.radius!),
                            borderSide: BorderSide(
                              color: widget.focusedBorderColor,
                              width: 1.2,
                            ),
                          ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(widget.radius!),
                        borderSide: BorderSide(
                          color: widget.buttonEnd == null
                              ? Colors.grey
                              : Colors.transparent,
                          width: 0.8,
                        ),
                      ),
                      hintStyle: widget.hintStyle ??
                          TextStyle(
                              fontSize: widget.fontSize,
                              color: widget.enabled
                                  ? widget.color
                                  : Colors.grey[600]),
                      labelStyle: TextStyle(color: widget.color),
                      fillColor: widget.fillColor,
                      filled: true,
                      prefixIcon: widget.prefixIcon,
                      contentPadding: widget.contentPadding ??
                          const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      hintText: widget.hintText,
                      labelText: widget.labelText),
                  validator: widget.adaValidasi == true ? _validate : null,
                  onSaved: widget.onSaved,
                ),
              ),
              widget.buttonEnd ?? Container()
            ],
          ),
        ],
      ),
    );
  }
}
