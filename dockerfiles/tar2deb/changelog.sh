#!/bin/bash
set -e

_THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")"; pwd)"
cp "${_THIS_DIR}/deb-template/debian/changelog" /tmp/changelog

{
  echo "@@@NAME@@@ (@@@VERSION@@@-$(date +%s)) trusty; urgency=medium"
  echo
  echo "@@@CHANGELOG@@@" | sed 's/^/  /'
  echo
  echo " -- @@@AUTHOR@@@ <@@@EMAIL@@@> $(date --rfc-2822)"
  echo
  cat /tmp/changelog
} > "$_THIS_DIR/changelog.new"

mv "$_THIS_DIR/changelog.new" "${_THIS_DIR}/deb-template/debian/changelog"

rm /tmp/changelog
