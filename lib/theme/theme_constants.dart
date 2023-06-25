import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/responsive.dart';

const COLOR_PRIMARY = Colors.deepOrangeAccent;
const COLOR_ACCENT = Colors.orange;

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: COLOR_PRIMARY,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: COLOR_ACCENT
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0)
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0))
      ),
      backgroundColor: MaterialStateProperty.all<Color>(COLOR_ACCENT)
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none
    ),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1)
  )
);

ThemeData darkTheme = ThemeData(

    brightness: Brightness.dark,
    // accentColor: Colors.white,
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)
    ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0)
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              )
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        overlayColor: MaterialStateProperty.all<Color>(Colors.black26)
      )
  ),
);


PreferredSizeWidget appBarTitleAndBack(
    BuildContext context, String headerText, bool isTextColorWhite,
    {bool isCloseBtn = true}) {
  return PreferredSize(
    preferredSize:
        Size.fromHeight((Responsive.isDesktop(context) || kIsWeb) ? 150 : 90),
    child: Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
            splashRadius: 24,
            icon: const Image(
              image: AssetImage('assets/icons/back_arrow_2.png'),
            ),
          ),
          new SizedBox(
            width: 20.0,
          ),
          justHeader(
              context, headerText, isTextColorWhite ? true : false, true),
          if (isCloseBtn) Spacer(),
          if (isCloseBtn)
            IconButton(
              onPressed: () => Navigator.pop(context),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(maxHeight: 20, maxWidth: 20),
              splashRadius: 24,
              icon: Image(
                image: AssetImage(isTextColorWhite
                    ? 'assets/icons/close_white.png'
                    : 'assets/icons/close.png'),
              ),
            ),
        ],
      ),
    ),
  );
}

Widget justHeader(
    BuildContext context, String heading, bool isTextColorWhite, bool isQr) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        heading,
        style: isTextColorWhite
            ? Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.white)
            : Theme.of(context).textTheme.headline1,
      ),
      // if (isQr)
      //   IconButton(
      //     onPressed: () {
      //       Navigator.of(context).push(MaterialPageRoute(
      //         builder: (context) => const QRViewExample(),
      //       ));
      //     },
      //     icon: Icon(
      //       Icons.qr_code,
      //       size: 38,
      //     ),
      //   )
    ],
  );
}
