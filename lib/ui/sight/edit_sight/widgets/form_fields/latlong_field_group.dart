import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/sight/edit_sight/edit_sight_state.dart';
import 'package:places/ui/sight/edit_sight/widgets/form_fields/latlong_field.dart';
import 'package:provider/provider.dart';

class LatLongFieldGroup extends StatefulWidget {
  final double? lat;
  final double? lng;

  const LatLongFieldGroup({
    this.lat,
    this.lng,
    Key? key,
  }) : super(key: key);

  @override
  State<LatLongFieldGroup> createState() => _LatLongFieldGroupState();
}

class _LatLongFieldGroupState extends State<LatLongFieldGroup> {
  late final TextEditingController latController;
  late final TextEditingController lngController;

  @override
  void initState() {
    super.initState();

    latController = TextEditingController(text: widget.lat?.toString());
    lngController = TextEditingController(text: widget.lng?.toString());
  }

  @override
  void dispose() {
    latController.dispose();
    lngController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeTextStyles;
    final colorsTheme = context.themeColors;
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
              controller: lngController,
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
            style: textTheme.text?.copyWith(
              color: colorsTheme.green,
            ),
          ),
        ),
      ],
    );
  }

  void pointOnMap(PointOnMap onPointOnMap) {
    const lat = 55.73495792679506;
    const lng = 37.58815325199811;
    latController.value = TextEditingValue(text: lat.toString());
    lngController.value = TextEditingValue(text: lng.toString());

    onPointOnMap(
      lat: lat,
      lng: lng,
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
    final latField = context.select<EditSightState, EditablePlaceGeoField>((s) => s.model.lat);
    final focusNode = context.select<EditSightState, FocusNode>((s) => s.latFocusNode);
    final onChanged = context.select<EditSightState, ValueChanged<double?>>((s) => s.editLat);

    return LatLongField(
      fieldKey: EditablePlaceFieldKeys.lat,
      field: latField,
      focusNode: focusNode,
      controller: controller,
      label: AppMessages.editingSight.latitudeFieldLabel,
      onChanged: onChanged,
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
    final lngField = context.select<EditSightState, EditablePlaceGeoField>((s) => s.model.lng);
    final focusNode = context.select<EditSightState, FocusNode>((s) => s.longFocusNode);
    final onChanged = context.select<EditSightState, ValueChanged<double?>>((s) => s.editLng);

    return LatLongField(
      fieldKey: EditablePlaceFieldKeys.lng,
      field: lngField,
      focusNode: focusNode,
      controller: controller,
      label: AppMessages.editingSight.latitudeFieldLabel,
      onChanged: onChanged,
    );
  }
}
