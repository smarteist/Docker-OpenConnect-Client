#!/bin/bash

run () {
  # Start openconnect
  echo "-----------" $(date -u) "-----------" >> oclogs.log
  echo $PASSWORD | openconnect $SERVER --servercert=$CERT --user=$USER --passwd-on-stdin --interface=OCTUN >> oclogs.log
}


startOpenConnect


until (run); do
  echo "openconnect exited. Restarting process in $RETRY_TIMEOUT seconds…" >&2
  sleep $RETRY_TIMEOUT
done
