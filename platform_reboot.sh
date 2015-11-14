#!/usr/bin/env bash


Yes_No ()
{
  ret="0"
  # print question
  echo -n "Are you sane and totally sure???? [yes/no]:"

  # read answer
  read YnAnswer

  # all to lower case
  YnAnswer=$(echo $YnAnswer | awk '{print tolower($0)}')

  # check and act on given answer
  case $YnAnswer in
    "yes")  ret="1" ;;
    "no")   ret="0" ;;
	*)  echo "Please answer yes or no" ; Yes_No ;;
  esac
  return $ret
}

Yes_No
if [ "$?" == "1" ]; then
	echo "Please stand by while rebooting the platform"
	ipmitool -U root -P calvin -H host1 chassis power reset
	ipmitool -U root -P calvin -H host2 chassis power reset
	ipmitool -U root -P calvin -H host3 chassis power reset
	ipmitool -U root -P calvin -H host4 chassis power reset
else
	echo "Reboot cancelled"
fi
