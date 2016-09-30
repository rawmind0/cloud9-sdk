FROM node:5.7.1-slim
MAINTAINER Ryan J. McDonough "ryan@damnhandy.com"

ENV SERVICE_HOME=/workspace

RUN apt-get update && \
    apt-get install -y python build-essential g++ libssl-dev apache2-utils git libxml2-dev sshfs && \
    git clone https://github.com/c9/core.git /cloud9 && \
    cd /cloud9 && \
    scripts/install-sdk.sh && \
    sed -i -e 's_127.0.0.1_0.0.0.0_g' /cloud9/configs/standalone.js && \
    apt-get autoremove -y python build-essential libssl-dev g++ libxml2-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /workspace

ADD root /
RUN chmod +x /*.sh 

VOLUME $SERVICE_HOME
WORKDIR $SERVICE_HOME

EXPOSE 8080

ENTRYPOINT ["/start.sh"]
CMD ["--listen 0.0.0.0 -p 8080 -w $SERVICE_HOME"]
