#! /bin/bash
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

count=1

while [[ $count -ge 1 ]]; do
  echo
  log=`system_profiler SPAirPortDataType | grep "Supported Channels:" | cut -d "," -f 13`

  if [[ $log != " 13" ]]; then
    echo $log
    echo -n "Restarting AirPort [$count] ... "
    sudo networksetup -setairportpower en0 off
    sleep 2
    sudo networksetup -setairportpower en0 on
    sleep 6
    let "count+=1"
    echo "DONE"
  else
    echo $log
    echo "Happy Networking"
    echo
    count=0
  fi
done

exit 0

# /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport
