library flutter_john;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FlutterJohn {
  static bool isIOS() => (Platform.isIOS);

  static Widget scaffold({required String string, required Widget body}) {
    return (isIOS())
        ? iOSScaffold(string, body)
        : androidScaffold(string, body);
  }

  static Future alert({required BuildContext context, required String text}) {
    return showDialog(
        context: context,
        builder: (context) {
          return isIOS()
              ? iOSAlert(context: context, value: text)
              : androidAlert(context: context, value: text);
        });
  }

  static androidAlert({required BuildContext context, required String value}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [text(string: value)],
      ),
      actions: [
        ElevatedButton(
          child: text(string: "ok"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  static iOSAlert({required BuildContext context, required String value}) {
    return CupertinoAlertDialog(
      content: Column(
        children: [
          text(string: value),
        ],
      ),
      actions: [
        CupertinoButton(
          child: text(string: "Ok"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  static Widget text(
      {required String string, Color? color, double? size, TextAlign? align}) {
    TextStyle style = textStyle(color: color, size: size);

    return (isIOS())
        ? iOSText(string: string, style: style, align: align)
        : androidText(string: string, style: style, align: align);
  }

  static Text androidText(
      {required String string, TextStyle? style, TextAlign? align}) {
    return Text(
      string,
      style: style,
    );
  }

  static DefaultTextStyle iOSText(
      {required String string, TextStyle? style, TextAlign? align}) {
    return DefaultTextStyle(
      style: style ?? const TextStyle(color: Colors.black),
      child: Text(
        string,
        textAlign: align ?? TextAlign.center,
      ),
    );
  }

  static TextStyle textStyle({Color? color, double? size, TextAlign? align}) {
    return TextStyle(color: color ?? Colors.black, fontSize: size ?? 20.0);
  }

  static Scaffold androidScaffold(String string, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: Text(string),
      ),
      body: body,
    );
  }

  static CupertinoPageScaffold iOSScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(string),
      ),
      child: body,
    );
  }
}
