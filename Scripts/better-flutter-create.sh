#!/usr/bin/env bash
set -euo pipefail

targetFile="${PWD}/$1/lib/main.dart"
flutter create "$1"

cp ~/Templates/flutter-template "$targetFile"

exit 0
