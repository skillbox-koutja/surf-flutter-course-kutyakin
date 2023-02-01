import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/sight_type.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:recase/recase.dart';

class CategorySelectScreen extends StatefulWidget {
  final SightType selected;
  final void Function() onClose;
  final void Function(SightType sightType) onSave;

  const CategorySelectScreen({
    required this.selected,
    required this.onClose,
    required this.onSave,
    Key? key,
  }) : super(key: key);

  @override
  State<CategorySelectScreen> createState() => _CategorySelectScreenState();
}

class _CategorySelectScreenState extends State<CategorySelectScreen> {
  late SightType selected;

  @override
  void initState() {
    super.initState();

    selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 56 + MediaQuery.of(context).padding.top),
                      _Header(
                        onClose: widget.onClose,
                      ),
                      const SizedBox(height: 24),
                      for (final sightType in SightType.availableForSelection())
                        _Option(sightType: sightType, select: onSelect, selected: selected),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: selected.isNone() ? null : onSave,
                          child: Text(
                            AppMessages.editingSight.saveButtonLabel,
                          ),
                        ),
                      ),
                      SizedBox(height: 8 + MediaQuery.of(context).padding.bottom),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onSelect(SightType value) {
    setState(() {
      selected = value;
    });
  }

  void onSave() {
    widget.onSave(selected);
  }
}

class _Header extends StatelessWidget {
  final void Function() onClose;

  const _Header({
    required this.onClose,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: onClose,
                child: ChevronLeftSvgIcon(
                  color: colorsTheme?.icon,
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              AppMessages.editingSight.categorySelectScreenTitle,
              style: textTheme?.subtitle,
            ),
          ),
        ],
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final SightType sightType;
  final SightType selected;
  final ValueChanged<SightType> select;

  const _Option({
    required this.sightType,
    required this.select,
    required this.selected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();

    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: selected == sightType ? null : onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: selected == sightType ? 12.0 : 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sightType.title.sentenceCase,
                  style: textTheme?.text,
                ),
                if (selected == sightType)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: TickSvgIcon(
                      color: colorsTheme?.green,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }

  void onTap() {
    select(sightType);
  }
}