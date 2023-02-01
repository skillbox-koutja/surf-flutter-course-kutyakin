import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/domain/sight/use_case/edit_sight/error.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/latlong_field.dart';
import 'package:provider/provider.dart';

class LatLongFieldGroup extends StatefulWidget {
  final double? lat;
  final double? long;

  const LatLongFieldGroup({
    this.lat,
    this.long,
    Key? key,
  }) : super(key: key);

  @override
  State<LatLongFieldGroup> createState() => _LatLongFieldGroupState();
}

class _LatLongFieldGroupState extends State<LatLongFieldGroup> {
  late final TextEditingController latController;
  late final TextEditingController longController;

  @override
  void initState() {
    super.initState();

    latController = TextEditingController(text: widget.lat?.toString());
    longController = TextEditingController(text: widget.long?.toString());
  }

  @override
  void dispose() {
    latController.dispose();
    longController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();
    final onPointOnMap = context.select<EditSightState, PointOnMap>((s) => s.pointOnMap);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _Lat(
              controller: latController,
            ),
            const SizedBox(width: 16),
            _Long(
              controller: longController,
            ),
          ],
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            pointOnMap(onPointOnMap);
          },
          child: Text(
            AppMessages.editingSight.pointOnMapTitle,
            style: textTheme?.text?.copyWith(
              color: colorsTheme?.green,
            ),
          ),
        ),
      ],
    );
  }

  void pointOnMap(PointOnMap onPointOnMap) {
    const lat = 55.73495792679506;
    const long = 37.58815325199811;
    latController.value = TextEditingValue(text: lat.toString());
    longController.value = TextEditingValue(text: long.toString());

    onPointOnMap(
      lat: lat,
      long: long,
    );
  }
}

class _Lat extends StatelessWidget {
  final TextEditingController controller;

  const _Lat({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final error = context.select<EditSightState, EditSightModelError?>((s) => s.model.latError);
    final focusNode = context.select<EditSightState, FocusNode>((s) => s.latFocusNode);
    final onChanged = context.select<EditSightState, ValueChanged<double?>>((s) => s.editLat);

    return LatLongField(
      focusNode: focusNode,
      controller: controller,
      label: AppMessages.editingSight.latitudeFieldLabel,
      onChanged: onChanged,
      error: error,
    );
  }
}

class _Long extends StatelessWidget {
  final TextEditingController controller;

  const _Long({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final error = context.select<EditSightState, EditSightModelError?>((s) => s.model.longError);
    final focusNode = context.select<EditSightState, FocusNode>((s) => s.longFocusNode);
    final onChanged = context.select<EditSightState, ValueChanged<double?>>((s) => s.editLong);

    return LatLongField(
      focusNode: focusNode,
      controller: controller,
      label: AppMessages.editingSight.latitudeFieldLabel,
      onChanged: onChanged,
      error: error,
    );
  }
}
