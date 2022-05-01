
## UI Sample


https://user-images.githubusercontent.com/43336844/166135050-4dd376ff-e9a5-4c82-a931-17984f903adf.mp4



## Installation

- Dart 2.16.0
- Flutter 2.10.0
- [npm (for git hooks)](https://treehouse.github.io/installation-guides/mac/node-mac.html)

## Environment

**iOS**
- iOS 13+

**Android**
- Android 5.1+
    - minSdkVersion 22
- targetSdkVersion 31

## App architecture

- Base on MVVM + Repository + [Riverpod](https://pub.dev/packages/riverpod) + [Hooks](https://pub.dev/packages/flutter_hooks)
- Support for multilingual and integrate Firebase Crashlytics, Firebase Remote Config, Firebase App Distribution, Firebase Cloud Messaging.
- Support distribution application to Firebase App Distribution and TestFlight by using Fastlane.

![image](https://user-images.githubusercontent.com/52640490/144163858-14cf3526-9086-44de-af41-35490ed148b7.png)

### Firebase service
- Using [Firebase Crashlytics](https://pub.dev/packages/firebase_crashlytics)
- Using [Firebase Remote Config](https://pub.dev/packages/firebase_remote_config)
- Using [Firebase App Distribution](https://firebase.google.com/docs/app-distribution)
- Using [Firebase Cloud Messaging](https://pub.dev/packages/firebase_messaging)

### Networking
- Using [dio](https://pub.dev/packages/dio) and [Retrofit](https://pub.dev/packages/retrofit) library.

### Local Data soure
- Using [sqflite](https://pub.dev/packages/sqflite) + Shared preferences

### Model class
- Using [Freezed](https://pub.dev/packages/freezed)

### UI
- Using [Material ](https://docs.flutter.dev/development/ui/widgets/material) components widgets.
- Using [WebView for Flutter](https://pub.dev/packages/webview_flutter)  that provides a WebView widget.
- Using [Flutter SVG](https://pub.dev/packages/flutter_svg) that draw SVG (and some Android VectorDrawable (XML)) files on a Flutter Widget.
- Using [Url launcher](https://pub.dev/packages/url_launcher) for launching a URL.

### Navigation  
- Using [Auto Route](https://pub.dev/packages/auto_route)

## Getting Started


### Setup

```shell script
$ make setup
$ export PATH="$PATH":"$HOME/.pub-cache/bin" # Add your run-commands (.zshrc, .bashrc, etc)
$ make dependencies
$ make build-runner
```

### How to add assets(images..)
1. Add assets
2. Run [FlutterGen](https://github.com/fluttergen)

### How to add localizations
1. Edit [*.arb](https://github.com/annh-2003/flutter_github_sample/tree/main/lib/l10n) files.
2. Run generate the `flutter pub get`

<br/>

### Make .apk and .ipa file

Android
```shell script
$ make build-android-dev
$ make build-android-prd
```

iOS
```shell script
$ make build-ios-dev
$ make build-ios-prd
```

### Run app
```shell script
$ make run-dev
$ make run-prd
```

## Firebase Distribution

- [Install Firebase Command Line Interface](https://firebase.google.com/docs/cli)
- [Install Fastlane](https://docs.fastlane.tools/#installing-fastlane)

### Run Firebase Distribute Android

```shell script
$ make distribute-android-dev
$ make distribute-android-prd
```

### Run Firebase Distribute iOS

```shell script
$ make distribute-ios-firebase-dev
$ make distribute-ios-firebase-prd
```

### Run TestFlight Distribute iOS

```shell script
$ make distribute-ios-testflight-dev
$ make distribute-ios-testflight-prd
```
