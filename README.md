# Cloud9 SDK Docker Container

This is a docker container that can executes the Cloud9 SDK.

## Usage

You can run either:

    docker run -d -v $(pwd):/workspace  -p 8080:8080 damnhandy/cloud9-sdk --listen 0.0.0.0 -p 8080 -w /workspace

If you're running this on a remote environment, you probabaly want to set a username and password by passing the `-a` or the `--auth` flag. The container exposes `/cloud9/server.js` and the **ENTRYPOINT** and it will accept all of the same arguments as described in the [Cloud9 SDK documentation](https://cloud9-sdk.readme.io/v0.1/docs/running-the-sdk). Please check there for those details.

A slightly more complicated setup so you can run docker as well:

    docker run -d -v $(pwd):/workspace \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v $(which docker):/bin/docker -p 8080:8080 \
        damnhandy/cloud9-sdk --listen 0.0.0.0 -p 8080 -w /workspace -a ${USER}:${PASS}

This will allow you to run docker commands on the host socket from within the Cloud9 SDK container.

Or you can modify the Docker compose file and to suit your needs and run:

    docker-compose up

Once running, you can point your browser to http://192.168.99.100:8080.


