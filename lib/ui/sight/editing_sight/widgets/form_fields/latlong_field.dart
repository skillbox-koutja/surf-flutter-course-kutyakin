import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/form_field_decorations.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/editable_sight.dart';
import 'package:places/ui/components/touch_detector.dart';
import 'package:places/ui/sight/editing_sight/widgets/field_label.dart';

class LatLongField extends StatefulWidget {
  final EditableSight sight;
  final ValueChanged<EditableSight> onChanged;
  final void Function(FocusNode focusNode) onFocusChange;
  final bool Function(FocusNode focusNode) isTouched;

  const LatLongField({
    required this.sight,
    required this.onChanged,
    required this.onFocusChange,
    required this.isTouched,
    Key? key,
  }) : super(key: key);

  @override
  State<LatLongField> createState() => _LatLongFieldState();
}

class _LatLongFieldState extends State<LatLongField> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _ValueInput(
              controller: latController,
              label: AppMessages.editingSight.latitudeFieldLabel,
              onFocusChange: widget.onFocusChange,
              isTouched: widget.isTouched,
              onChanged: (value) {
                widget.onChanged(
                  widget.sight.changeLatLong(
                    lat: double.tryParse(value),
                    long: widget.sight.long,
                  ),
                );
              },
              isValid: () {
                return widget.sight.isValidLat;
              },
            ),
            const SizedBox(width: 16),
            _ValueInput(
              controller: longController,
              label: AppMessages.editingSight.longitudeFieldLabel,
              onFocusChange: widget.onFocusChange,
              isTouched: widget.isTouched,
              onChanged: (value) {
                widget.onChanged(
                  widget.sight.changeLatLong(
                    lat: widget.sight.lat,
                    long: double.tryParse(value),
                  ),
                );
              },
              isValid: () {
                return widget.sight.isValidLong;
              },
            ),
          ],
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: pointOnTheMap,
          child: Text(
            AppMessages.editingSight.pointOnTheMapTitle,
            style: textTheme?.text?.copyWith(
              color: colorsTheme?.green,
            ),
          ),
        ),
      ],
    );
  }

  void pointOnTheMap() {
    print('AddSightForm.pointOnTheMap'); // ignore: avoid_print
    const lat = 55.73495792679506;
    const long = 37.58815325199811;
    final sight = widget.sight.changeLatLong(
      lat: lat,
      long: long,
    );
    latController.value = TextEditingValue(text: lat.toString());
    longController.value = TextEditingValue(text: long.toString());

    widget.onChanged(sight);
  }
}

class _ValueInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final ValueChanged<String> onChanged;
  final bool Function() isValid;
  final void Function(FocusNode focusNode) onFocusChange;
  final bool Function(FocusNode focusNode) isTouched;

  const _ValueInput({
    required this.controller,
    required this.label,
    required this.onChanged,
    required this.isValid,
    required this.onFocusChange,
    required this.isTouched,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(
            label: label,
          ),
          TouchDetector(
            onFocusChange: onFocusChange,
            builder: ({
              required focusNode,
              required void Function() onFocusChange,
            }) {
              return TextFormField(
                controller: controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                focusNode: focusNode,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(RegExp('^[0-9]+.?[0-9]*')),
                ],
                decoration: doubleFieldInputDecoration,
                onChanged: onChanged,
                validator: (value) {
                  if (isTouched(focusNode) && !isValid()) {
                    return '';
                  }

                  return null;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
