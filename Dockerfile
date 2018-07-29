FROM nouchka/phantomjs:latest
ARG FUNC_NAME=phantomjs-speed

USER root
ADD https://github.com/openfaas/faas/releases/download/0.8.0/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

COPY func.sh /usr/bin/${FUNC_NAME}
ENV fprocess="/usr/bin/${FUNC_NAME}"
ENV write_debug="true"

HEALTHCHECK --interval=5s CMD [ -e /tmp/.lock ] || exit 1
ENTRYPOINT [ "fwatchdog" ]
