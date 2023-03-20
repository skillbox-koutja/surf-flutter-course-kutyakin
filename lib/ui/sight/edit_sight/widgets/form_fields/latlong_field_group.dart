import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/core/utils/extensions/build_context_ext.dart';
import 'package:places/domain/places/place/use_case/edit/model.dart';
import 'package:places/ui/sight/edit_sight/edit_place_screen/wm.dart';
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
  @override
  Widget build(BuildContext context) {
    final textTheme = context.themeTextStyles;
    final colorsTheme = context.themeColors;
    final wm = context.read<IEditPlaceScreenWidgetModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            _Lat(),
            SizedBox(width: 16),
            _Long(),
          ],
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            pointOnMap(wm.onPointOnMap);
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

    onPointOnMap(
      lat: lat,
      lng: lng,
    );
  }
}

class _Lat extends StatelessWidget {
  const _Lat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wm = context.read<IEditPlaceScreenWidgetModel>();
    final latField =
        context.select<IEditPlaceScreenWidgetModel, EditablePlaceGeoField>((wm) => wm.editablePlace.value.lat);

    return LatLongField(
      fieldKey: EditablePlaceFieldKeys.lat,
      field: latField,
      focusNode: wm.latFocusNode,
      controller: wm.latFieldController,
      label: AppMessages.editingSight.latitudeFieldLabel,
    );
  }
}

class _Long extends StatelessWidget {
  const _Long({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wm = context.read<IEditPlaceScreenWidgetModel>();
    final lngField =
        context.select<IEditPlaceScreenWidgetModel, EditablePlaceGeoField>((wm) => wm.editablePlace.value.lng);

    return LatLongField(
      fieldKey: EditablePlaceFieldKeys.lng,
      field: lngField,
      focusNode: wm.lngFocusNode,
      controller: wm.lngFieldController,
      label: AppMessages.editingSight.longitudeFieldLabel,
    );
  }
}
