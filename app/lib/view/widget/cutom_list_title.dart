
import '../../helper/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListTile extends StatelessWidget {
  final String itemName;
  final int itemId;
  final Function(int) onTap;

  CustomListTile({required this.itemName, required this.itemId, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(itemId);
      },
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          itemName,
          style: AppTextStyleTheme.madelTextView.copyWith(
            color: context.theme.dividerColor,
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
