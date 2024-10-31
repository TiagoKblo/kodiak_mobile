import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionsSelect extends StatelessWidget {
  final String optionSelected;
  final Function() onTap;

  const OptionsSelect({
    super.key,
    required this.optionSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: const Color(0xffe4e4e7)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                optionSelected,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
            const Icon(
              CupertinoIcons.chevron_down,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
