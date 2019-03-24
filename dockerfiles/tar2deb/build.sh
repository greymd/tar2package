#!/bin/bash
set -eu
load_vars () {
  local _file="$1"
  _NAME="$(yq r "$_file" name)"
  _CMDNAME="$(yq r "$_file" cmdname)"
  _SUMMARY="$(yq r "$_file" summary)"
  _DESCRIPTION="$(yq r "$_file" description)"
  _VERSION="$(yq r "$_file" version)"
  _CHANGELOG="$(yq r "$_file" changelog)"
  _URL="$(yq r "$_file" url)"
  _AUTHOR="$(yq r "$_file" author)"
  _EMAIL="$(yq r "$_file" email)"
}

inject_vars () {
  local _file="$1"
  sed -i "s/@@@NAME@@@/$_NAME/g" "$_file"
  sed -i "s/@@@CMDNAME@@@/$_CMDNAME/g" "$_file"
  sed -i "s/@@@SUMMARY@@@/$_SUMMARY/g" "$_file"
  sed -i "s/@@@DESCRIPTION@@@/$_DESCRIPTION/g" "$_file"
  sed -i "s/@@@VERSION@@@/$_VERSION/g" "$_file"
  sed -i "s/@@@CHANGELOG@@@/$_CHANGELOG/g" "$_file"
  sed -i "s/@@@URL@@@/${_URL//\//\\/}/g" "$_file"
  sed -i "s/@@@AUTHOR@@@/$_AUTHOR/g" "$_file"
  sed -i "s/@@@EMAIL@@@/$_EMAIL/g" "$_file"
}

{
  cd /tmp
  (
    mkdir -p /tmp/extract
    cd /tmp/extract
    cat | tar zxv
  )
  cp -rf "/tmp/extract"/{bin,man} /tmp/deb-template/
  load_vars "/tmp/extract/.tar2package.yml"
  inject_vars /tmp/changelog.sh
  inject_vars /tmp/deb-template/debian/control
  inject_vars /tmp/deb-template/debian/copyright
  bash -x /tmp/changelog.sh
  mv /tmp/deb-template "/tmp/${_CMDNAME}-${_VERSION}"
  cd "/tmp/${_CMDNAME}-${_VERSION}"
  debuild -sd <<<y || true
} >&2
cat /tmp/*.deb
