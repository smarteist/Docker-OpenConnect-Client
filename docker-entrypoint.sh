#!/bin/bash



# Make Config
if ! [ -f "/etc/occlient/server.conf" ] ; then
mkdir -p /etc/occlient/

cat > /etc/occlient/server.conf <<-EOSRV
# --------------------------------------------
# Uncomment your config and modify as needed.
# --------------------------------------------

# SERVER=$SERVER
# CERT=$CERT
# PASSWORD=$PASSWORD
# USERNAME=$USERNAME
OC_OPTIONS="$OC_OPTIONS"
RETRY_TIMEOUT=30
INTERFACE_NAME=OC_BRIDGE
CONNECTION_LOGS=/dev/null
EOSRV
fi


# Load config
. /etc/occlient/server.conf

run_oc () {
  # Start openconnect
  echo "-----------" $(date -u) "-----------" >> $CONNECTION_LOGS
  echo $PASSWORD | openconnect $SERVER $OC_OPTIONS --user=$USERNAME --passwd-on-stdin --interface=$INTERFACE_NAME >> $CONNECTION_LOGS
}

# Run sticky with retry timeout
until (run_oc); do
  echo "openconnect exited. Restarting process in $RETRY_TIMEOUT seconds…" >&2
  sleep $RETRY_TIMEOUT
done
