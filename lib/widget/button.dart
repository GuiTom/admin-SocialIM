import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ButtonSize {
  Big,
  Small,
}

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.title,
      required this.buttonSize,
      this.margin,
      this.borderRadius,
      this.padding,
      this.disabled,
      this.colors,
      this.textColor, this.onTap});
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final String title;
  final ButtonSize buttonSize;
  final double? borderRadius;
  final List<Color>? colors;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  final bool? disabled;

  @override
  Widget build(BuildContext context) {
    if (buttonSize == ButtonSize.Big) {
      return Container(
        alignment: AlignmentDirectional.center,
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 6),
          gradient: disabled == true
              ? null
              : LinearGradient(
                  colors: colors ??
                      [const Color(0xFFB77DFF), const Color(0xFF7658FF)]),
          color: disabled == true ? const Color(0xFF919191) : null,
        ),
        child: Text(
          title,
          maxLines: 1,
          style: TextStyle(
              color: textColor ?? Colors.white, fontWeight: FontWeight.w500),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 80,
          child: UnconstrainedBox(
            child: Container(
              alignment: AlignmentDirectional.center,
              padding:
                  padding ?? const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius ?? 6),
                gradient: disabled == true
                    ? null
                    : LinearGradient(
                        colors: colors ?? [const Color(0xFFB77DFF), const Color(0xFF7658FF)]),
                color: disabled == true ? const Color(0xFF919191) : null,
              ),
              child: Text(
                title,
                maxLines: 1,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
