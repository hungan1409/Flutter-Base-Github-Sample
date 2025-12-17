# Flutter GitHub Sample

A Flutter sample project demonstrating clean architecture with MVVM pattern, Riverpod state management, and various best practices.

## UI Sample
[Get data](https://github.com/user-attachments/assets/99913795-bbff-4edb-91a5-49459b698817)

[Change language](https://github.com/user-attachments/assets/063a164c-f6eb-4e32-9ccf-dec83770e8e4)

[View log directly](https://github.com/user-attachments/assets/67b3a4fe-e0d4-4c41-8370-d38d52671bca)

## Requirements

- Dart SDK: ^3.8.0
- Flutter: 3.38.0
- [npm (for git hooks)](https://treehouse.github.io/installation-guides/mac/node-mac.html)

## Environment

**iOS**
- iOS 13+

**Android**
- Android 5.1+
  - minSdkVersion 22
- targetSdkVersion 35

## App Architecture

- Base on **MVVM + Repository** pattern
- State Management: [Riverpod](https://pub.dev/packages/hooks_riverpod) + [Flutter Hooks](https://pub.dev/packages/flutter_hooks)
- Support for multilingual (i18n)
- Integrate Firebase services (Crashlytics, Remote Config, App Distribution, Cloud Messaging)
- Support distribution to Firebase App Distribution and TestFlight via Fastlane

![Architecture](https://user-images.githubusercontent.com/52640490/144163858-14cf3526-9086-44de-af41-35490ed148b7.png)

## Tech Stack

### State Management
| Library | Version | Description |
|---------|---------|-------------|
| [hooks_riverpod](https://pub.dev/packages/hooks_riverpod) | 3.0.3 | Riverpod with hooks support |
| [flutter_hooks](https://pub.dev/packages/flutter_hooks) | 0.21.3+1 | React-like hooks for Flutter |
| [riverpod_annotation](https://pub.dev/packages/riverpod_annotation) | 3.0.3 | Annotations for Riverpod code generation |

### Networking
| Library | Version | Description |
|---------|---------|-------------|
| [dio](https://pub.dev/packages/dio) | 5.9.0 | HTTP client |
| [retrofit](https://pub.dev/packages/retrofit) | 4.9.1 | Type-safe REST client generator |
| [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger) | 1.4.0 | Dio logger interceptor |

### Firebase Services
| Library | Version | Description |
|---------|---------|-------------|
| [firebase_core](https://pub.dev/packages/firebase_core) | 4.3.0 | Firebase Core |
| [firebase_crashlytics](https://pub.dev/packages/firebase_crashlytics) | 5.0.6 | Crash reporting |
| [firebase_remote_config](https://pub.dev/packages/firebase_remote_config) | 6.1.3 | Remote configuration |
| [firebase_messaging](https://pub.dev/packages/firebase_messaging) | 16.1.0 | Push notifications |
| [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) | 19.5.0 | Local notifications |

### Data & Model
| Library | Version | Description |
|---------|---------|-------------|
| [freezed](https://pub.dev/packages/freezed) | 3.2.3 | Code generation for immutable classes |
| [json_serializable](https://pub.dev/packages/json_serializable) | 6.11.2 | JSON serialization |
| [shared_preferences](https://pub.dev/packages/shared_preferences) | 2.5.4 | Key-value storage |
| [equatable](https://pub.dev/packages/equatable) | 2.0.7 | Value equality |

### Navigation
| Library | Version | Description |
|---------|---------|-------------|
| [auto_route](https://pub.dev/packages/auto_route) | 11.1.0 | Declarative routing |

### UI Components
| Library | Version | Description |
|---------|---------|-------------|
| [flutter_svg](https://pub.dev/packages/flutter_svg) | 2.2.3 | SVG rendering |
| [cached_network_image](https://pub.dev/packages/cached_network_image) | 3.4.1 | Image caching |
| [google_fonts](https://pub.dev/packages/google_fonts) | 6.3.3 | Google Fonts |
| [webview_flutter](https://pub.dev/packages/webview_flutter) | 4.13.0 | WebView widget |
| [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) | 5.9.3 | Screen adaptation |
| [url_launcher](https://pub.dev/packages/url_launcher) | 6.3.2 | URL launching |

### Logging & Debugging
| Library | Version | Description |
|---------|---------|-------------|
| [talker_flutter](https://pub.dev/packages/talker_flutter) | 5.1.9 | Advanced logger |
| [talker_riverpod_logger](https://pub.dev/packages/talker_riverpod_logger) | 5.1.9 | Riverpod logger |
| [talker_dio_logger](https://pub.dev/packages/talker_dio_logger) | 5.1.9 | Dio logger |

### Code Generation (Dev Dependencies)
| Library | Version | Description |
|---------|---------|-------------|
| [build_runner](https://pub.dev/packages/build_runner) | 2.10.4 | Code generation runner |
| [freezed](https://pub.dev/packages/freezed) | 3.2.3 | Model code generation |
| [retrofit_generator](https://pub.dev/packages/retrofit_generator) | 10.2.0 | API code generation |
| [auto_route_generator](https://pub.dev/packages/auto_route_generator) | 10.4.0 | Route code generation |
| [flutter_gen_runner](https://pub.dev/packages/flutter_gen_runner) | 5.12.0 | Assets code generation |
| [riverpod_generator](https://pub.dev/packages/riverpod_generator) | 3.0.3 | Riverpod code generation |

## Getting Started

### Setup

```shell
# Install dependencies and setup git hooks
make setup

# Add pub-cache to PATH (add to your .zshrc or .bashrc)
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Get Flutter dependencies
make dependencies

# Run code generation
make build-runner
```

### How to Add Assets (Images, SVGs, etc.)

1. Add assets to `assets/images/` or `assets/svgs/` folder
2. Run [FlutterGen](https://github.com/fluttergen) to generate asset references:
   ```shell
   make build-runner
   ```
3. Use generated assets: `Assets.images.xxx` or `Assets.svgs.xxx`

### How to Add Localizations

1. Edit ARB files in [lib/l10n/](lib/l10n/):
   - `intl_messages_en.arb` - English
   - `intl_messages_ja.arb` - Japanese
2. Run to generate localizations:
   ```shell
   flutter pub get
   ```

## Build & Run

### Run App

```shell
# Development
make run-dev

# Production
make run-prd
```

### Build APK/IPA

**Android:**
```shell
make build-android-dev
make build-android-prd
```

**iOS:**
```shell
make build-ios-dev
make build-ios-prd
```

## Distribution

### Prerequisites

- [Firebase CLI](https://firebase.google.com/docs/cli)
- [Fastlane](https://docs.fastlane.tools/#installing-fastlane)

### Firebase App Distribution

**Android:**
```shell
make distribute-android-dev
make distribute-android-prd
```

**iOS:**
```shell
make distribute-ios-firebase-dev
make distribute-ios-firebase-prd
```

### TestFlight (iOS)

```shell
make distribute-ios-testflight-dev
make distribute-ios-testflight-prd
```

## Project Structure

```
lib/
├── data/
│   ├── handler/        # Result handlers
│   ├── model/          # Data models (Freezed)
│   ├── remote/         # API services (Retrofit)
│   └── repository/     # Repository implementations
├── foundation/         # Utilities, constants
├── gen/                # Generated code (FlutterGen)
├── l10n/               # Localization files
├── provider/           # Riverpod providers
├── route/              # Auto Route configuration
└── ui/
    ├── component/      # Reusable widgets
    ├── hook/           # Custom hooks
    ├── theme/          # App theme, colors, text styles
    └── [feature]/      # Feature modules (page + view_model)
```

## License

MIT License
