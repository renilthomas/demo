#!/usr/bin/env bash
set -e

# My vars
LOGFILE=$1
TIMEOUT=60

# Print error and exit 1
exit_err() {
    (>&2 printf "$(tput setaf 1)%s$(tput sgr0)\n" "${1}") && exit 1
}


if [ $# != 1 ]; then
    echo "Usage: $0 param1"
    echo "* param1: <full path to the Apache log file>"
    exit_err "Logfile argument missing!"
fi


# check if a binary is in the path, exit 1 if not
find_exe() {
  local exe=$1; shift
  local cmd

  cmd=$(command -v "${exe}")

  [[ -n ${cmd} ]] || exit_err "Unable to find the '${exe}' command. Please make sure it is installed and available in your PATH."
  echo "${cmd}"
}

TAIL=$(find_exe "tail")
AWK=$(find_exe "awk")
SORT=$(find_exe "sort")
UNIQ=$(find_exe "uniq")
DATE=$(find_exe "date")
SLEEP=$(find_exe "sleep")
ECHO=$(find_exe "echo")

# HTTP Status code counts every 60s in a loop 

while true
do
 NOW=$($DATE +"%T")
 $ECHO -e '\0033\0143'
 printf "${NOW}\n"
 printf "==========\n"
 printf "Count Code\n"
 printf "==========\n"
 $TAIL ${LOGFILE} | $AWK '{print $9}' | $SORT | $UNIQ -c
 $SLEEP ${TIMEOUT}
done

