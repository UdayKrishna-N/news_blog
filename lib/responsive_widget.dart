import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {

  final Widget mobile;
  final Widget desktop;

   Responsive({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  static bool isMobile(BuildContext context){
    return MediaQuery.of(context).size.width < 530;
  }


  static bool isDesktop(BuildContext context){
    return MediaQuery.of(context).size.width >= 530;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if(size.width >= 530){
      return desktop;
    }else{
      return mobile;
    }

  }
}
