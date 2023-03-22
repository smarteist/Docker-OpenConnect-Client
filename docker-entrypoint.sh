#!/bin/bash

if [[ -z "${RETRY_TIMEOUT}" ]]; then
  RETRY_TIMEOUT=30
fi

run () {
  # Start openconnect
  echo "-----------" $(date -u) "-----------" >> oclogs.log
  echo $PASSWORD | openconnect $SERVER --servercert=$CERT --user=$USER --passwd-on-stdin --interface=OCTUN >> oclogs.log
}

until (run); do
  echo "openconnect exited. Restarting process in $RETRY_TIMEOUT seconds…" >&2
  sleep $RETRY_TIMEOUT
done
