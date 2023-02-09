#!/bin/bash

dart ./scripts/generate_icon_classes.dart
dart format ./lib/ui/components/icons
