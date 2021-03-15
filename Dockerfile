FROM python:3-alpine

ENV AWSCLI_VERSION='1.19.27'

RUN python3 -m pip --no-cache-dir install awscli==${AWSCLI_VERSION}
RUN python3 -m pip --no-cache-dir install awscli_plugin_endpoint

ENTRYPOINT ["aws"]
