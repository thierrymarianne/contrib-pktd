#!/bin/bash

function build() {
  cd "${GITHUB_WORKSPACE}" || exit

  source ./do GOOS=windows GOARCH=amd64

  mkdir ./bin/bin

  mv ./bin/*.exe ./bin/bin

  cd bin || exit

  zip -r "./${RELEASE_NAME}-win.zip" ./bin
}
build