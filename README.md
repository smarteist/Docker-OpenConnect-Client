# Docker OpenConnect Client

## Build

Source code available in [this](https://github.com/smarteist/Docker-OpenConnect-Client) repository.

```bash
docker build -t smarteist/openconnect-client ./
```

## Run

```bash
docker run -dit --name occlient --privileged \
    -e RETRY_TIMEOUT=30 \
    -e SERVER="oc.mydomain.com" \
    -e USERNAME="username" \
    -e PASSWORD="mypassword" \
    -e OC_OPTIONS="--servercert=pin-sha256:2246178263f....3b686b645e37=" \
    smarteist/openconnect-client
```

### Configurations

Config files available in ```/etc/occlient/server.conf``` you can modify it to get logs or change other
options.


### Logging

To save connection logs, you can either:

1. **Edit the Config File**: Uncomment the `CONNECTION_LOGS` line in `/etc/occlient/server.conf`:

   ```bash
   #CONNECTION_LOGS=/dev/null
   CONNECTION_LOGS=/oclogs.log
   ```

2. **Set an Environment Variable**: When starting the container, use:

   ```bash
   docker run <...> -e CONNECTION_LOGS=/oclogs.log <...>
   ```

After making changes, restart the container. To view the logs, run:

```bash
docker exec -it occlient tail -f /oclogs.log
```

This will let you monitor the connection logs in real-time.

## Usage Example

To use oc client as network of other container, set net option of that container when you run it.

```docker run <...> --net container:occlient <...> someimage```

