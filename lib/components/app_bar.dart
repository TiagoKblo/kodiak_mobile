import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kodiak/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height / 12,
      leadingWidth: 90,
      leading: Container(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          icon: const Row(
            children: [
              Icon(
                CupertinoIcons.chevron_left,
                color: Colors.white,
              ),
              Text(
                'Voltar',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          onPressed: onBackPressed,
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(darkBlue),
                Color(lightBlue),
              ]),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 5))
          ],
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w600, fontSize: 28),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
