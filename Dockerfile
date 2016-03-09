FROM node:5.7.1-slim
MAINTAINER Ryan J. McDonough "ryan@damnhandy.com"

RUN apt-get update \
    && apt-get install -y python build-essential g++ libssl-dev apache2-utils git libxml2-dev sshfs \
    && git clone https://github.com/c9/core.git /cloud9

WORKDIR /cloud9
RUN scripts/install-sdk.sh

# Tweak standlone.js conf
RUN sed -i -e 's_127.0.0.1_0.0.0.0_g' /cloud9/configs/standalone.js \
    #&& apt-get autoremove -y python build-essential libssl-dev g++ libxml2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && mkdir /workspace

VOLUME ["/workspace"]

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/node", "server.js"]
CMD ["--listen 0.0.0.0 -p 8080 -w /workspace"]
