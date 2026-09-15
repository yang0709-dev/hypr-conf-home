#!/usr/bin/env bash
set -euo pipefail

targetFile="${PWD}/$1/lib/main.dart"
targetDir="${PWD}/$1"
flutter create "$1"

cp ~/Templates/flutter-template "$targetFile"
cp ~/Templates/AGPLv3 "$targetDir/LICENSE"
nvim "$targetDir"

exit 0
