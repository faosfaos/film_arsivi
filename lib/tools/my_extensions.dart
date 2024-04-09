//my_extensions.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//Random
extension MyNum on num {
  num random(num max) {
    var number;
    try {
      if (this is int) {
        number = this + Random().nextInt((max - this).toInt());
        return number;
      } else if (this is double) {
        number = this + Random().nextDouble() * (max - this).toDouble();
        return number;
      } else {
        return throw ArgumentError(
            'Sadece int veya double tipinde sayılar desteklenir.');
      }
    } catch (e) {
      print(
          "Lütfen iki double veya iki int sayı arasında random sayı üretin.\n\nÖrneğin:\n3 ile 3.3 arasında sayı üretmek istediğinizde, 3.toRandom(3.3) yazmak yerine 3.0.toRandom(3.3) yazın.\n\nHata açıklaması: $e");
    }
    return number;
  }
}

extension MyStringExtensions on String {
  MyElevatedButton get elevatedButton => MyElevatedButton(this);

  int get toInt => int.parse(this);
  double get toDouble => double.parse(this);
}

extension MyListExtensions on List {
  MyDropDownBottom get dropDownBottom => MyDropDownBottom(this);
  MyRadioListTile get radioListTile => MyRadioListTile(this);
}

extension MyContextExtensions on BuildContext {
  MyShowDialog get showDialog => MyShowDialog(this);
}

class MyShowDialog {
  BuildContext context;
  MyShowDialog(this.context);

  Future make({
    String? title,
    Widget? content,
    List<Widget>? actions,
    double? height,
    double? width,
    double? border,
    double? borderRadius,
    Color? borderColor,
    Color? backgroundColor,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          shape: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? Colors.transparent, width: border ?? 1),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 1),
            ),
          ),
          title: Text(title ?? ""),
          content: SizedBox(
            height: height,
            width: width ?? MediaQuery.of(context).size.width,
            child: content,
          ),
          actions: actions,
        );
      },
    );
  }
}

//my_elevatedbutton.dart
class MyElevatedButton {
  String _data;
  MyElevatedButton(this._data);

  Color? _bgColor;
  Color? _textColor;
  VoidCallback? _onPressed;
  VoidCallback? _onLongPress;
  Function(bool)? _onHover;

  double? _left;
  double? _right;
  double? _top;
  double? _bottom;
  double? _leftMargin;
  double? _rightMargin;
  double? _topMargin;
  double? _bottomMargin;
  double? _elevation;

  double? _borderWidth;
  double? _strokeAlign;
  Color? _borderColor;
  double? _textSize;
  double? _width;
  double? _height;
  bool? _bold;
  TextDecoration? _textDecoration;
  bool _combine = false;
  List<TextDecoration>? _decorationsList;

  Widget make() {
    return SizedBox(
      width: _width,
      height: _height,
      child: Padding(
        padding: EdgeInsets.only(
            left: _leftMargin ?? 0,
            right: _rightMargin ?? 0,
            top: _topMargin ?? 0,
            bottom: _bottomMargin ?? 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: _elevation,
            padding: EdgeInsets.only(
                left: _left ?? 24,
                right: _right ?? 24,
                top: _top ?? 0,
                bottom: _bottom ?? 0),
            backgroundColor: _bgColor,
            side: BorderSide(
              color: _borderColor ?? Colors.transparent,
              width: _borderWidth ?? 1,
              strokeAlign: _strokeAlign ?? 0,
            ),
            textStyle: TextStyle(
              color: _textColor,
              fontSize: _textSize,
              fontWeight: _bold == true ? FontWeight.bold : FontWeight.normal,
              decoration: _combine
                  ? TextDecoration.combine(_decorationsList!)
                  : _textDecoration,
            ),
          ),
          onPressed: _onPressed ?? () {},
          onLongPress: _onLongPress ?? () {},
          onHover: _onHover,
          child: Text(
            _data,
            style: TextStyle(color: _textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }

  MyElevatedButton combineTextDecoration(List<TextDecoration> decorationsList) {
    _combine = true;
    _decorationsList = decorationsList;
    return this;
  }

  MyElevatedButton get overline {
    _textDecoration = TextDecoration.overline;
    return this;
  }

  MyElevatedButton get underline {
    _textDecoration = TextDecoration.underline;
    return this;
  }

  MyElevatedButton get lineThrough {
    _textDecoration = TextDecoration.lineThrough;
    return this;
  }

  MyElevatedButton get bold {
    _bold = true;
    return this;
  }

  MyElevatedButton size(double size) {
    _textSize = size;
    return this;
  }

  MyElevatedButton width(double size) {
    _width = size;
    return this;
  }

  MyElevatedButton height(double size) {
    _height = size;
    return this;
  }

  MyElevatedButton elevation(double elevation) {
    _elevation = elevation;
    return this;
  }

  MyElevatedButton border({
    Color? color = Colors.black,
    double? width,
    double? strokeAlign,
  }) {
    _borderColor = color;
    _borderWidth = width;
    _strokeAlign = strokeAlign;
    return this;
  }

  MyElevatedButton mOnly(
      {double left = 0, double right = 0, double top = 0, double bottom = 0}) {
    _leftMargin = left;
    _rightMargin = right;
    _topMargin = top;
    _bottomMargin = bottom;
    return this;
  }

  MyElevatedButton pOnly(
      {double left = 0, double right = 0, double top = 0, double bottom = 0}) {
    _left = left;
    _right = right;
    _top = top;
    _bottom = bottom;
    return this;
  }

  MyElevatedButton p(double value) {
    _left = value;
    _right = value;
    _top = value;
    _bottom = value;
    return this;
  }

  MyElevatedButton pX(double value) {
    _left = value;
    _right = value;
    _top = 10;
    _bottom = 10;
    return this;
  }

  MyElevatedButton pY(double value) {
    _left = 10;
    _right = 10;
    _top = value;
    _bottom = value;
    return this;
  }

  MyElevatedButton onPressed(void Function() onPressed) {
    _onPressed = onPressed;
    return this;
  }

  MyElevatedButton onLongPress(void Function() onLongPress) {
    _onLongPress = onLongPress;
    return this;
  }

  MyElevatedButton onHover(void Function(bool value) onHover) {
    _onHover = onHover;
    return this;
  }

  MyElevatedButton backgroundColor(Color Colors) {
    _bgColor = Colors;
    return this;
  }

  MyElevatedButton color(Color Colors) {
    _textColor = Colors;
    return this;
  }

  MyElevatedButton get textColorRed {
    _textColor = Colors.red;
    return this;
  }
}

class MyDropDownBottom {
  List _list;
  MyDropDownBottom(
    this._list,
  );

  Widget make({
    String? hintText,
    Color? hintTextColor,
    Color? dropdownColor,
    Color? textColor,
    Color? focusColor,
    Color? iconDisabledColor,
    Color? iconEnabledColor,
    double? hinTextSize,
    AlignmentGeometry? alignmentGeometry,
    AlignmentGeometry? textAlignmentGeometry,
    double? textSize,
    bool? textBold,
    bool? hintTextBold,
    double? borderRadius,
    double? iconSize,
    double? menuMaxHeight,
    double? itemHeight,
    bool? autofouc,
    bool? isExpanded,
    bool? enableFeedback,
    bool? isDense,
    Widget? icon,
    Widget? disabledHint,
    Widget? underline,
    Widget? textIcon,
    int? elevation,
    EdgeInsets? padding,
    TextStyle? style,
    FocusNode? focusNode,
    MainAxisAlignment? textIconMainAxisAlignment,
    Key? itemKey,
    Key? key,
    required dynamic value,
    required void Function(dynamic selectedValue) onChange,
    void Function()? onTap,
    List<Widget> Function(BuildContext context)? selectedItemBuilder,
  }) {
    return DropdownButton(
      key: key,
      autofocus: autofouc ?? false,
      icon: icon,
      iconSize: iconSize ?? 24.0,
      isExpanded: isExpanded ?? false,
      menuMaxHeight: menuMaxHeight,
      elevation: elevation ?? 0,
      onTap: onTap,
      itemHeight: itemHeight == null
          ? kMinInteractiveDimension
          : itemHeight <= kMinInteractiveDimension
              ? kMinInteractiveDimension
              : itemHeight,
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      padding: padding,
      disabledHint: disabledHint,
      style: style,
      focusColor: focusColor,
      focusNode: focusNode,
      enableFeedback: enableFeedback,
      iconDisabledColor: iconDisabledColor,
      iconEnabledColor: iconEnabledColor,
      isDense: isDense ?? false,
      selectedItemBuilder: selectedItemBuilder,
      underline: underline,
      dropdownColor: dropdownColor,
      value: value,
      alignment: alignmentGeometry ?? const Alignment(0, 0),
      hint: Text(
        hintText ?? "",
        style: TextStyle(
            color: hintTextColor,
            fontSize: hinTextSize,
            fontWeight:
                hintTextBold ?? false ? FontWeight.bold : FontWeight.normal),
      ),
      items: _list.map((item) {
        return DropdownMenuItem(
            alignment: textAlignmentGeometry ?? const Alignment(0, 0),
            value: item,
            key: itemKey,
            child: textIcon == null
                ? Text(
                    item.toString(),
                    style: TextStyle(
                      color: textColor,
                      fontSize: textSize,
                      fontWeight: textBold ?? false
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  )
                : Row(
                    mainAxisAlignment:
                        textIconMainAxisAlignment ?? MainAxisAlignment.center,
                    children: [
                      textIcon,
                      Text(
                        item.toString(),
                        style: TextStyle(
                          color: textColor,
                          fontSize: textSize,
                          fontWeight: textBold ?? false
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ));
      }).toList(),
      onChanged: (value) {
        value = value;
        onChange(value);
      },
    );
  }
}

class MyRadioListTile {
  MyRadioListTile(this.data);
  List data;

  List<Widget> make({
    void Function(bool value)? onFocusChange,
    required void Function(dynamic selectedValue, int index) onChange,
    required dynamic value,
    Key? key,
    Color? activeColor,
    Color? fillColor,
    Color? hoverColor,
    Color? selectedTileColor,
    Color? overlayColor,
    Color? tileColor,
    bool? autofocus,
    bool? dense,
    bool? enableFeedback,
    bool? isThreeLine,
    bool? selected,
    bool? showSubTitle,
    double? splashRadius,
    bool? toggleable,
    EdgeInsets? contentPadding,
    ShapeBorder? shape,
    FocusNode? focusNode,
    Widget? secondary,
    List<String>? subtitle,
    VisualDensity? visualDensity,
    MouseCursor? mouseCursor,
    MaterialTapTargetSize? materialTapTargetSize,
    ListTileControlAffinity? controlAffinity,
  }) {
    subtitle == null ? subtitle = [] : null;
    return List.generate(
      data.length,
      (index) => RadioListTile(
        key: key,
        title: Text(data[index]),
        value: data[index],
        groupValue: value,
        onChanged: (selectedValue) {
          onChange(selectedValue, index);
        },
        activeColor: activeColor,
        autofocus: autofocus ?? false,
        contentPadding: contentPadding,
        controlAffinity: controlAffinity ?? ListTileControlAffinity.platform,
        fillColor: MaterialStatePropertyAll(fillColor),
        focusNode: focusNode,
        hoverColor: hoverColor,
        dense: dense,
        enableFeedback: enableFeedback,
        isThreeLine: isThreeLine ?? false,
        secondary: secondary,
        onFocusChange: onFocusChange,
        selected: selected ?? false,
        selectedTileColor: selectedTileColor,
        shape: shape,
        splashRadius: splashRadius,
        subtitle: showSubTitle == true
            ? subtitle!.length >= data.length
                ? Text(subtitle[index])
                : Container(
                    child: const Text(
                        "Range error for subtitle list. Please make the number of items of the subtitle list equal to the number of items of the other list"),
                  )
            : const SizedBox(),
        overlayColor: MaterialStatePropertyAll(overlayColor),
        tileColor: tileColor,
        toggleable: toggleable ?? false,
        visualDensity: visualDensity,
        mouseCursor: mouseCursor,
        materialTapTargetSize: materialTapTargetSize,
      ),
    );
  }
}
