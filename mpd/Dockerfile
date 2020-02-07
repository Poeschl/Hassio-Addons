ARG BUILD_FROM
FROM $BUILD_FROM

ENV MPD_VERSION='0.21.16-r1'
ENV YMPD_VERSION='1.3.0-r8'

RUN apk add -Uu --no-cache --purge \
        mpc=0.33-r0 \
        mpd=$MPD_VERSION \
        ympd=$YMPD_VERSION \
    && rm -rf /var/cache/apk/* /tmp/*

COPY run.sh /
COPY mpd.conf /etc/mpd.conf
RUN chmod a+x /run.sh

EXPOSE 6600 6680
CMD [ "/run.sh" ]
