#!/usr/bin/env sh
#
# @(#) : CI's text linting script
#
# @version	1.0.0
# @date		2024-12-31
# @author	Furukawa, Atsushi <atsushifx@gmail.com>
# @license	MIT
#
# @desc<<
#
# lint script for writing markdown text.
#
#<<

### initialize
set -euC -o pipefail
readonly THISCMD=$( basename  "$0" )


# cd "$SCRIPTDIR"

## librarys

## main block (call this script as command)]

while IFS= read -r filename; do
  # check secret
  secretlint "$filename"

  ## text review with textlint
  textlint --cache --quiet "$filename" || exit 1

  ## check markdown
  markdownlint-cli2 --cache "$filename" || exit

done

exit 0
;; __EOF__
