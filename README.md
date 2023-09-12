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
    -e OC_OPTIONS="--servercert=pin-sha256:26657320797d4f5b385d43274a246178263f3b686b645e37=" \
    smarteist/openconnect-client
```

### Configurations

Config files available in ```/etc/occlient/server.conf``` you can modify it to get logs or change other
options.


### Logging

To use save connection logs into the log file uncomment the ```CONNECTION_LOGS``` in config file ```/etc/occlient/server.conf```:

```bash
#CONNECTION_LOGS=/dev/null
CONNECTION_LOGS=/oclogs.log
```
Restart the container, and then you can see connection logs like so:

```bash
docker exec -it occlient tail -f /oclogs.log
```

## Usage Example

To use oc client as network of other container, set net option of that container when you run it.

```docker run <...> --net container:occlient <...> someimage```
