import 'package:audio_kumbh/constant/assets_constant.dart';
import 'package:audio_kumbh/constant/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class CustumAppbar extends StatefulWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? title;

  const CustumAppbar({super.key, this.leading, this.actions, this.title});

  @override
  State<CustumAppbar> createState() => _CustumAppbarState();
}

class _CustumAppbarState extends State<CustumAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
              icon: SvgPicture.asset(AssetsConstant.drawericon),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        },
      ),
      actions: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(right: 20),
          child: SvgPicture.asset(AssetsConstant.bellicon),
        ),
      ],
      centerTitle: true,
      title: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: SvgPicture.asset(AssetsConstant.searchicon),
            ),
            hintText: StringConstant.textfromfield,
            hintStyle:  TextStyle(
              fontFamily: 'f1',
              color: Colors.brown,
              fontSize: 16.sp,
            ),
          ),
          autofocus: false,
          cursorColor: Colors.brown,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
