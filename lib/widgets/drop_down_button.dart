import 'package:flutter/material.dart';
import 'package:flux_payments/config/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String _choosenVal = "Sort";
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      selectedItemBuilder: (context) {
        // setState(() {
        //   print("hi");
        // });
        return [];
      },
      value: _choosenVal,
      menuMaxHeight: 200,
      style: GoogleFonts.montserrat(
        color: AppTheme.main,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      dropdownColor: Color(0xffE9E9FF),
      onChanged: (String? s) {
        setState(() {
          _choosenVal = s ?? "";
        });
      },
      // iconSize:30,
      iconEnabledColor: AppTheme.main,
      icon: ImageIcon(
        AssetImage(
          "assets/images/drop_down.png",
        ),
      ),
      //       Container(
      //   height: 24,
      //   child: FloatingActionButton(
      //     onPressed: null,
      //     shape: CircleBorder(
      //       side: BorderSide(
      //         color: AppTheme.main,
      //         width: 3,
      //       ),
      //     ),
      //     backgroundColor: Colors.white,
      //     mini: true,
      //     child: Icon(
      //       Icons.arrow_downward_outlined,
      //       color: AppTheme.main,
      //       size: 16,
      //     ),
      //   ),
      // ),
      hint: Text(
        "Sort",
        style: GoogleFonts.montserrat(
          color: AppTheme.main,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
      items: <String>[
        "Sort",
        "Nearest Store",
        "Least flux Points",
        "My favorite brand"
      ].map<DropdownMenuItem<String>>((String s) {
        return DropdownMenuItem(
          child: Text(s),
          value: s,
        );
      }).toList(),
      isDense: false,
    );
  }
}
