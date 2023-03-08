import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/ui/components/icons/empty/svg_icons.dart';

class ErrorState extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? description;
  final Widget? actions;

  const ErrorState({
    this.icon,
    this.title,
    this.description,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = context.themeTextStyles;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon ?? const _DefaultErrorIcon(),
        const SizedBox(height: 24),
        Text(
          title ?? AppMessages.failure.failureTitle,
          style: textTheme.subtitle?.copyWith(
            color: theme.disabledColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          description ?? AppMessages.failure.failureDescription,
          style: textTheme.small?.copyWith(
            color: theme.disabledColor,
          ),
          textAlign: TextAlign.center,
        ),
        if (actions != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: actions,
          ),
      ],
    );
  }
}

class FailureActionLabel extends StatelessWidget {
  final String label;
  const FailureActionLabel({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeTextStyles;
    final colorsTheme = context.themeColors;

    return Text(
      label,
      style: textTheme.text?.copyWith(
        color: colorsTheme.green,
      ),
    );
  }
}

class GoBackAction extends StatelessWidget {
  const GoBackAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: FailureActionLabel(
          label: AppMessages.failure.failureGoBackAction,
        ),
      );
}

class _DefaultErrorIcon extends StatelessWidget {
  const _DefaultErrorIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CancelSvgIcon(
        color: Theme.of(context).disabledColor,
      );
}
