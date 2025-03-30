#!/usr/bin/env bash

## Function to get the current timestamp
get_timestamp() {
  date +"%Y%m%d_%H%M%S"
}

## Function to print error messages to stderr
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

## Function to print debug messages to stderr
debug() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}
