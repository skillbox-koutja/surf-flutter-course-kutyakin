import 'package:flutter/material.dart';
import 'package:places/assets/messages/locale/ru.dart';
import 'package:places/assets/theme/colors.dart';
import 'package:places/assets/theme/typography.dart';
import 'package:places/ui/icons/svg_icons.dart';
import 'package:places/ui/onboarding/onboarding_screen.dart';
import 'package:places/ui/settings/settings_state.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.extension<CustomTextStyles>();
    final colorsTheme = theme.extension<CustomColors>();

    return Consumer<SettingsState>(
      builder: (_, settings, __) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: theme.scaffoldBackgroundColor,
              centerTitle: true,
              elevation: 0,
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  AppMessages.settings.screenTitle,
                  style: textTheme?.subtitle,
                ),
              ),
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppMessages.settings.darkModeSwitcherLabel,
                      style: textTheme?.text,
                    ),
                    Switch.adaptive(
                      value: settings.isDark,
                      onChanged: (isDark) {
                        settings.toggleDarkMode();
                      },
                      inactiveTrackColor: AppColors.inactive,
                      activeTrackColor: colorsTheme?.green?.withOpacity(0.5),
                      activeColor: colorsTheme?.green,
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppMessages.settings.watchTutorialLabel,
                      style: textTheme?.text,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: openOnboardingScreen,
                        child: InfoSvgIcon(
                          color: colorsTheme?.green,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }

  void openOnboardingScreen() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return OnboardingScreen(
          onSkip: () {
            Navigator.of(context).pop();
          },
          onStart: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
