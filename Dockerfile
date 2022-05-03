FROM alpine:latest


ARG MODE=build

COPY ./content /.tachiworkdir/

RUN apk add --no-cache bash runit curl caddy ttyd tzdata \
    && chmod +x /.tachiworkdir/service/*/run /.tachiworkdir/service/*/log/run /.tachiworkdir/*.sh \
    && ln -s /.tachiworkdir/service/* /etc/service/

ENTRYPOINT ["sh","/.tachiworkdir/entrypoint.sh"]
