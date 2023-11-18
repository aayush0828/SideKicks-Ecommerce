import 'package:flutter/material.dart';

class sectiontitle extends StatelessWidget {
  final String title; // Correct the parameter name to 'String'

  const sectiontitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}