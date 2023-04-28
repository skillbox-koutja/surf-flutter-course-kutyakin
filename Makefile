code_gen:
	flutter pub run build_runner build --delete-conflicting-outputs

code_clean:
	find . -maxdepth 20 -type f \( -name "*.freezed.dart" -o  -name "*.g.dart" \) -delete

avd:
	./scripts/run_avd.sh

android_apk_release:
	flutter build apk --split-per-abi
