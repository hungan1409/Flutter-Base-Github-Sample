.PHONY: setup
setup:
	npm install

.PHONY: dependencies
dependencies:
	flutter pub get

.PHONY: analyze
analyze:
	flutter analyze

.PHONY: format 
format:
	flutter format lib/

.PHONY: format-analyze
format-analyze:
	flutter format --dry-run lib/
	flutter analyze

.PHONY: build-runner
build-runner:
	flutter packages pub run build_runner build --delete-conflicting-outputs

.PHONY: run-dev
run-dev:
	flutter run --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: run-prd
run-prd:
	flutter run --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-android-dev
build-android-dev:
	flutter build apk --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-android-prd
build-android-prd:
	flutter build apk --release --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-ios-dev
build-ios-dev:
	flutter build ios --no-codesign --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-ios-prd
build-ios-prd:
	flutter build ios --release --no-codesign --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-android-bundle-dev
build-android-bundle-dev:
	flutter build appbundle --flavor development --dart-define=FLAVOR=development --target lib/main.dart

.PHONY: build-android-bundle-prd
build-android-bundle-prd:
	flutter build appbundle --flavor production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: build-ipa
build-ipa:
	flutter build ipa --release --export-options-plist=ios/ExportOptions.plist --flavor Production --dart-define=FLAVOR=production --target lib/main.dart

.PHONY: distribute-android-dev
distribute-android-dev:
	cd android && fastlane android android_dev

.PHONY: distribute-android-prd
distribute-android-prd:
	cd android && fastlane android android_prd

# Need setup in XCode the iOS App provisioning profiles and p12 for authentication -> build IPA
.PHONY: distribute-ios-firebase-dev
distribute-ios-firebase-dev:
	cd ios && fastlane ios ios_firebase_development

# Need setup in XCode the iOS App provisioning profiles and p12 for authentication -> build IPA
.PHONY: distribute-ios-firebase-prd
distribute-ios-firebase-prd:
	cd ios && fastlane ios ios_firebase_production

# Need setup in XCode the iOS App provisioning profiles and p12 for authentication -> build IPA
# Need create an App Store Connect API Key -> distribute to TestFlight
.PHONY: distribute-ios-testflight-dev
distribute-ios-testflight-dev:
	cd ios && fastlane ios ios_testflight_development

# Need setup in XCode the iOS App provisioning profiles and p12 for authentication -> build IPA
# Need create an App Store Connect API Key -> distribute to TestFlight
.PHONY: distribute-ios-testflight-prd
distribute-ios-testflight-prd:
	cd ios && fastlane ios ios_testflight_production

