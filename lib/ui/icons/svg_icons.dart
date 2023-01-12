import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class SvgIcon extends StatelessWidget {
  final String path;
  final Color? color;

  const SvgIcon({required this.path, this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: color,
    );
  }
}

class ArrowSvgIcon extends SvgIcon {
  const ArrowSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/arrow.svg');
}

class CalendarSvgIcon extends SvgIcon {
  const CalendarSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/calendar.svg');
}

class CrossSvgIcon extends SvgIcon {
  const CrossSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/cross.svg');
}

class GoSvgIcon extends SvgIcon {
  const GoSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/go.svg');
}

class Go64SvgIcon extends SvgIcon {
  const Go64SvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/go_64.svg');
}

class HeartSvgIcon extends SvgIcon {
  const HeartSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/heart.svg');
}

class FullHeartSvgIcon extends SvgIcon {
  const FullHeartSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/heart_full.svg');
}

class ListSvgIcon extends SvgIcon {
  const ListSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/list.svg');
}

class FullListSvgIcon extends SvgIcon {
  const FullListSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/list_full.svg');
}

class MapSvgIcon extends SvgIcon {
  const MapSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/map.svg');
}

class SettingsSvgIcon extends SvgIcon {
  const SettingsSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/settings.svg');
}

class ShareSvgIcon extends SvgIcon {
  const ShareSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/share.svg');
}

class EmptySightListSvgIcon extends SvgIcon {
  const EmptySightListSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/sight_list_empty.svg');
}

class TickSvgIcon extends SvgIcon {
  const TickSvgIcon({
    super.key,
    super.color,
  }) : super(path: 'assets/icons/tick.svg');
}
