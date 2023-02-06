import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/ui/icons/svg_icons.dart';

class SearchBar extends StatelessWidget {
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final List<Widget>? suffixIcons;

  const SearchBar({
    this.onTap,
    this.controller,
    this.suffixIcons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final suffixIcons = this.suffixIcons ?? [];

    return TextField(
      controller: controller,
      autofocus: controller != null,
      readOnly: onTap != null,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'[\s/\\]')),
      ],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        hintText: AppMessages.searchSights.searchFieldLabel,
        filled: true,
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: SearchSvgIcon(color: theme.disabledColor),
        ),
        suffixIcon: (suffixIcons.isEmpty) ? null : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min, // added line
          children: suffixIcons,
        ),
      ),
      onTap: onTap,
    );
  }
}
