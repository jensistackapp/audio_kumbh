import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class AppText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final String? fontFamily;

  const AppText(
      {Key? key,
      this.text,
      this.fontSize,
      this.color,
      this.overflow,
      this.fontWeight,
      this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontSize: fontSize ?? 18.sp,
        overflow: overflow,
        color: color ?? const Color(0xFF512A00),
        fontWeight: fontWeight,
        fontFamily: fontFamily ?? 'f1',
      ),
    );
  }
}
