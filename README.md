[![](https://images.microbadger.com/badges/image/rawmind/cloud9-sdk.svg)](https://microbadger.com/images/rawmind/cloud9-sdk "Get your own image badge on microbadger.com")

cloud9-sdk
==============

This image is the cloud9-sdk base. 

## Build

```
docker build -t rawmind/cloud9-sdk:<version> .
```

## Versions

- `0.3.0-2` [(Dockerfile)](https://github.com/rawmind0/cloud9-sdk/blob/0.3.0-2/Dockerfile)

## Configuration

This image runs [cloud9-sdk][cloud9-sdk]. 

Besides, you can customize the configuration in several ways:

### Default Configuration

Cloud9 is installed with the default configuration and some parameters can be overrided with env variables:

- GIT_REPO=""	# Optional: Git repo to sync in your environment


## Example

See [rancher-example][rancher-example], rancher catalog package that runs zookeeper in a cattle environment with dynamic configuration.


[cloud9-sdk]: https://cloud9-sdk.readme.io/
[rancher-example]: https://github.com/rawmind0/cloud9-sdk/tree/master/rancher
