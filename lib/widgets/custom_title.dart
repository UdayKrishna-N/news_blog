import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: RichText(
        text: TextSpan(
          text: "News",
          style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
            fontFamily: "Calligraffitti",
            color: Color(0xFFFD7E14),
          ),
          children: [
            TextSpan(
              text: "App",
              style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                fontFamily: "Roboto",
              ),
            ),
          ],
        ),
      ),
    );
  }
}