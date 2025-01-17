import 'package:flutter/material.dart';

Row aboutMeText(Color? color) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(
        Icons.info_outline_rounded,
        color: Color(0xffdb2877),
        size: 28,
      ),
      const SizedBox(width: 8),
      Text("About Me",
          style: TextStyle(
            color: color,
            fontSize: 20,
            // fontWeight: FontWeight.bold,
          )),
      SizedBox(width: 4),
      Icon(
        Icons.arrow_right_alt,
        color: color,
        size: 20,
      ),
    ],
  );
}

Row downloadResumeText(Color color) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.article_outlined,
        color: Color(0xffc125d3),
        size: 28,
      ),
      SizedBox(width: 8),
      Text("Read CV!",
          style: TextStyle(
            color: color,
            fontSize: 20,
            // fontWeight: FontWeight.bold,
          )),
      SizedBox(width: 4),
      Icon(
        Icons.arrow_right_alt,
        color: color,
        size: 20,
      ),
    ],
  );
}