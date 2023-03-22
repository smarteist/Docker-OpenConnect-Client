# Docker OpenConnect Client

## Build

```bash
docker build -t occlient ./
```

## Run

```bash
docker run -dit --name occlient --privileged \
    -e RETRY_TIMEOUT=30 \
    -e SERVER="oc.mydomain.com" \
    -e USER="username" \
    -e PASSWORD="mypassword" \
    -e CERT="pin-sha256:26657320797d4f5b385d43274a246178263f3b686b645e37=" \
    occlient
```

### Check connection status

```bash
docker exec -it occlient tail -f /oclogs.log
```

## Usage

To use oc client as network of other container, set net option of that container when you run it.

```docker run <...> --net container:occlient <...> someimage```
