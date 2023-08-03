########################################################################
#
# Makefile template for Flutter
#
# Copyright 2021 (c) Graham.Williams@togaware.com
#
# License: Creative Commons Attribution-ShareAlike 4.0 International.
#
########################################################################

define FLUTTER_HELP
flutter:

  android Run with an attached Android device;
  chrome  Run with the chrome device;
  emu	  Run with the android emulator;
  linux   Run with the linux device;
  doc	  Run `dart doc` to create documentation.
  test	  Run `flutter test` for testing.
  itest	  Run `flutter test integration_test` for interation testing.

  metrics      Run metrics over the code base:
    nullable
    unused_code
    unused_files
    analyze

endef
export FLUTTER_HELP

help::
	@echo "$$FLUTTER_HELP"

.PHONY: chrome
chrome:
	flutter run -d chrome

# 20220503 gjw The following fails if the target files already exist -
# just needs to be run once.
#
# dart run build_runner build --delete-conflicting-outputs
#
# List the files that are automatically generated. Then they will get 
# built as required.

BUILD_RUNNER = \
#	lib/models/synchronise_time.g.dart

$(BUILD_RUNNER):
	dart run build_runner build --delete-conflicting-outputs

pubspec.lock:
	flutter pub get

.PHONY: linux
linux: pubspec.lock $(BUILD_RUNNER)
	flutter run -d linux

.PHONY: macos
macos: $(BUILD_RUNNER)
	flutter run -d macos

.PHONY: android
android: $(BUILD_RUNNER)
	flutter run -d $(shell flutter devices | grep android | cut -d " " -f 5)

.PHONY: emu
emu:
	@if [ -n "$(shell flutter devices | grep emulator | cut -d" " -f 6)" ]; then \
	  flutter run -d $(shell flutter devices | grep emulator | cut -d" " -f 6); \
	else \
	  flutter emulators --launch Pixel_3a_API_30; \
	  echo "Emulator has been started. Rerun `make emu` to build the app."; \
	fi

.PHONY: linux_config
linux_config:
	flutter config --enable-linux-desktop

.PHONY: metrics
metrics: nullable unused_code unused_files analyze

.PHONY: nullable
nullable:
	dart run dart_code_metrics:metrics check-unnecessary-nullable lib

.PHONY: unused_code
unused_code:
	dart run dart_code_metrics:metrics check-unused-code lib

.PHONY: unused_files
unused_files:
	dart run dart_code_metrics:metrics check-unused-files lib

.PHONY: analyze
analyze:
	dart run dart_code_metrics:metrics analyze lib --reporter=console

.PHONY: doc
doc:
	dart doc

# Run the integration tests for the desktop device (linux, windows,
# macos). Without this explictly specified, if I have my android
# device connected to the computer then the testing defaults to trying
# to install on android. 20230713 gjw

.PHONY: test
test:
	flutter test test

.PHONY: itest
itest:
	flutter test --device-id \
	$(shell flutter devices | grep desktop | perl -pe 's|^[^•]*• ([^ ]*) .*|\1|') \
	integration_test

clean::
	flutter clean
	flutter pub get
