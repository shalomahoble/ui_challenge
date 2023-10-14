// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ui_challenge/config/size_config.dart';

import 'package:ui_challenge/config/style.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.blockHorizontal! * 30,
        height: SizeConfig.blockHorizontal! * 30,
        decoration: const BoxDecoration(
          color: Kgreen,
          shape: BoxShape.circle,
        ),
        alignment: AlignmentDirectional.center,
        child: Icon(
          Icons.arrow_forward,
          size: SizeConfig.blockHorizontal! * 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
