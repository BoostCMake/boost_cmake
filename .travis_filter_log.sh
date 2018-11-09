#!/bin/bash
TIME_START=$(date +%s)
STEP=100
WAS_OUTPUT_STEP=false
WAS_OUTPUT_300=false
echo ${START}

while read line; do
  TIME_CURRENT=$(date +%s)
  #echo $(((${TIME_CURRENT} - ${TIME_START}) % ${STEP}))
  if [ "$WAS_OUTPUT_STEP" = false ] ; then
      echo "${line}"
      echo ${TIME_CURRENT}
      WAS_OUTPUT_STEP=true
  fi
  if [ "WAS_OUTPUT_300" = false ] ; then
      echo "Make in progress"
      WAS_OUTPUT_300=true
  fi
  if [ $(((${TIME_CURRENT} - ${TIME_START}) % ${STEP})) == 0 ] ; then
     WAS_OUTPUT_STEP=false
  fi 
  if [ $(((${TIME_CURRENT} - ${TIME_START}) % ${STEP})) == 300 ] ; then
     WAS_OUTPUT_300=false
  fi 
done < /dev/stdin
