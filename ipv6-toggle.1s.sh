#!/usr/bin/env zsh
#

echo "IPv6"
echo "---"


if $(networksetup  -getinfo   "Wi-Fi"  | grep -q "^IPv6: Automatic") 
then
  echo "Disable ipv6 | shell=$HOME/bin/ipv6-off.sh terminal=false"
else
  echo "Enable ipv6 | shell=$HOME/bin/ipv6-on.sh terminal=false"
fi
