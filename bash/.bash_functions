#!/usr/bin/env bash

#   ___                         __
# /'___\                       /\ \__  __
#/\ \__/  __  __    ___     ___\ \ ,_\/\_\    ___     ___     ____
#\ \ ,__\/\ \/\ \ /' _ `\  /'___\ \ \/\/\ \  / __`\ /' _ `\  /',__\
# \ \ \_/\ \ \_\ \/\ \/\ \/\ \__/\ \ \_\ \ \/\ \L\ \/\ \/\ \/\__, `\
#  \ \_\  \ \____/\ \_\ \_\ \____\\ \__\\ \_\ \____/\ \_\ \_\/\____/
#   \/_/   \/___/  \/_/\/_/\/____/ \/__/ \/_/\/___/  \/_/\/_/\/___/
#

# =============================================================================
# Ansi codes
# =============================================================================

# Making ansi codes easier to use and more readable
get_colour_code() {
  local colour_code=""
  local style_code=""

  # Handle bold asci codes
  if [[ "$ansi_code" == *bold* ]]; then
    style_code="${style_code}\e[1m"
  fi

  # Handle italic asci codes
  if [[ "$ansi_code" == *italic* ]]; then
    style_code="${style_code}\e[3m"
  fi

  # Handle underline asci codes
  if [[ "$ansi_code" == *underline* ]]; then
    style_code="${style_code}\e[4m"
  fi

  # Handle strikethrough asci codes
  if [[ "$ansi_code" == *strikethrough* ]]; then
    style_code="${style_code}\e[9m"
  fi

  # Convert colour name to ansi code
  if [[ "$ansi_code" == *black* ]]; then
    colour_code="\e[0;30m"
  elif [[ "$ansi_code" == *red* ]]; then
    colour_code="\e[0;31m"
  elif [[ "$ansi_code" == *green* ]]; then
    colour_code="\e[0;32m"
  elif [[ "$ansi_code" == *yellow* ]]; then
    colour_code="\e[0;33m"
  elif [[ "$ansi_code" == *blue* ]]; then
    colour_code="\e[0;34m"
  elif [[ "$ansi_code" == *purple* ]]; then
    colour_code="\e[0;35m"
  elif [[ "$ansi_code" == *cyan* ]]; then
    colour_code="\e[0;36m"
  elif [[ "$ansi_code" == *white* ]]; then
    colour_code="\e[0;37m"
  else
    colour_code="\e[0;37m" # Default to white if ansi_code is not recognized
  fi

  # Replace 3 with 9 for high intensity colours
  if [[ "$ansi_code" == *high_intensity* ]]; then
    colour_code="${colour_code//3/9}"
  fi

  # Combine colour and style codes
  ansi_code="${colour_code}${style_code}"

  # Reset ansi code
  reset_ansi='\e[0m'
}

# =============================================================================
# Debugging and error handling
# =============================================================================

# Function to print debug messages to STDERR
# shellcheck disable=SC2034
debug() {
  # Check if debug is enabled
  # shellcheck disable=SC2154
  if [ "$debug" = true ]; then
    ansi_code=orange
    get_colour_code
    # Print the debug message
    echo -e "[${ansi_code}DEBUG${reset_ansi} $(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
  fi
}

# Function to print error messages to STDERR
error() {
  ansi_code=red
  get_colour_code
  echo -e "[${ansi_code}ERROR${reset_ansi} $(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

# =============================================================================
# Formatting
# =============================================================================

# Function to print a separator
print_separator() {

  # Character to use for the separator
  local character="$1"
  # Default to '-' if character is not provided
  if [[ -z "$character" ]]; then
    character="-"
  fi

  # Number of characters in the separator
  local separator_length="$2"
  # Default to terminal width if number of characters is not provided
  if ! [[ "$separator_length" =~ ^[0-9]+$ ]]; then
    separator_length=$(tput cols)
  fi

  # Colour to use for the separator
  local ansi_code="$3"
  # Default to white if color is not provided
  if [[ -z "$ansi_code" ]]; then
    ansi_code=white
  fi
  get_colour_code

  # Print the separator
  echo -e "${ansi_code}$(printf "%${separator_length}s" | tr ' ' "$character")${reset_ansi}"
}

figlet_header() {
  ansi_code=high_intensity_black
  get_colour_code
  echo -e "${ansi_code}$(figlet "$1")${reset_ansi}"
}

cowsay_footer() {
  echo -e "\n$(cowsay "$1")"
  ansi_code=green_underline
  print_separator ";" 40 "$ansi_code"
}
