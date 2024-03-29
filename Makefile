code_gen:
	flutter pub run build_runner build --delete-conflicting-outputs

code_clean:
	find . -maxdepth 20 -type f \( -name "*.freezed.dart" -o  -name "*.g.dart" \) -delete

avd:
	./scripts/run_avd.sh

app_icons_gen:
	flutter pub run flutter_launcher_icons:main

android_apk_release:
	flutter build apk --split-per-abi

android_apk_analyze_size:
	flutter build apk --analyze-size --target-platform=android-x64 --flavor=prod
