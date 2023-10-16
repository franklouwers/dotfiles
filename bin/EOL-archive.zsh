#!/usr/bin/env zsh

PATH=/opt/bin:/bin:/usr/bin:/usr/local/bin:/opt/homebrew/bin
cd "$(dirname "$2")"

pendingdir="$(realpath "$PWD")"
targetdir="../../long/aankoop"

filename=$(basename "$2")
logf="/tmp/mylog.txt"
#    echo $filename >> $logf
targetdir="$(realpath "$pendingdir/$targetdir")"

#osascript -e "display dialog \"targetdir: $targetdir\""
#    echo $targetdir >> $logf
base=24600000 #change every year!
year=2024 #change every year!
dagboek=600 #aankoopdagboek

let "nr = $base + $1"

filenamebase="EOL-$year-$dagboek.$nr-"

## Check if file exists
existingfiles=($targetdir/$filenamebase*(ND))
if (( #existingfiles > 0 ))
then
  osascript -e "display dialog \"File already exists at $existingfiles\""
  exit 42
fi

cpdf -add-text "### $year-$dagboek.$nr ###" -top 15 -font "Courier" -font-size 12 "$2" -o "$targetdir/$filenamebase$filename" -decrypt-force
if [ $? -ne 0 ]; then
   msg="display dialog \"Something went wrong when cpdf-ing.\""
   osascript -e "$msg"
fi
trash "$2"
