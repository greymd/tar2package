#!/bin/bash

set -u
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
  mkdir "/tmp/extract"
  cat > "/tmp/extract/template.tar.gz"
  cd "/tmp/extract" || exit 1
  tar zxvf template.tar.gz
  rm -f template.tar.gz
  load_vars "/tmp/extract/template.yml"
  inject_vars "/tmp/template.spec"
  mkdir -p /tmp/extract/"${_CMDNAME}-${_VERSION}"
  mv "/tmp/extract/"{bin,man} /tmp/extract/"${_CMDNAME}-${_VERSION}"
  tar -zcvf "${_CMDNAME}-${_VERSION}.tar.gz" -C "/tmp/extract" "${_CMDNAME}-${_VERSION}"
  mkdir -p "${HOME}/rpmbuild/SOURCES/"
  mv "${_CMDNAME}-${_VERSION}.tar.gz" "${HOME}/rpmbuild/SOURCES/template.tar.gz"
  rpmbuild --undefine=_disable_source_fetch -ba /tmp/template.spec
} >&2
# It is expectec to be single file.
cat "${HOME}/rpmbuild/RPMS/$(uname -m)"/*.rpm
