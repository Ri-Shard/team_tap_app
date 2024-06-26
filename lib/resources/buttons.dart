import 'package:flutter/material.dart';
import 'package:team_tap_app/my_theme.dart';

class Buttons extends StatefulWidget {
  final Widget? content;
  final Color? color;
  final Color? focuscolor;
  final Color? hovercolor;
  final Color? highlightColor;
  final Color? splashColor;
  final VoidCallback? ontap;
  final Color? borderColor;
  final double? borderradius;

  const Buttons(
      {super.key,
      this.content,
      this.color,
      this.ontap,
      this.borderColor,
      this.borderradius,
      this.focuscolor,
      this.hovercolor,
      this.highlightColor,
      this.splashColor});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      onPressed: widget.ontap,
      color: widget.color,
      splashColor: widget.splashColor,
      hoverColor: widget.hovercolor,
      focusColor: widget.focuscolor,
      highlightColor: widget.highlightColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderradius ?? 100),
          side: BorderSide(color: widget.borderColor ?? MyTheme.brown)),
      child: widget.content,
    );
  }
}
