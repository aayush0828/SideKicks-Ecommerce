
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Center( // Wrap the Text widget with Center
          // ignore: deprecated_member_use
          child: Center(
            child: Text(title, style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.blue)
            ),
          )
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(icon: Icon(Icons.favorite), onPressed: () {
          Navigator.pushNamed(context, '/wishlist');
        }),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}



