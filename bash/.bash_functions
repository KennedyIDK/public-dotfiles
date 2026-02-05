#!/bin/bash

source ${HOME}/.bash_aliases

# Combo cd and ls
cv() {
  cd "$1" && ls -A
}

webtest() {
  local website_dir="$HOME/public/website"

  cd $website_dir
  hugo server --buildDrafts
}
