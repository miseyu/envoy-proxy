FROM envoyproxy/envoy-alpine:v1.10.0

RUN apk --no-cache add libintl && \
  apk --no-cache add --virtual .gettext gettext && \
  cp /usr/bin/envsubst /usr/local/bin/envsubst && \
  apk del .gettext

COPY ./config/envoy-sidecar.yaml.template /etc/envoy-sidecar.yaml.template
RUN mkdir /var/log/envoy/
CMD /bin/sh -c "envsubst < /etc/envoy-sidecar.yaml.template > /etc/envoy-sidecar.yaml && /usr/local/bin/envoy -c /etc/envoy-sidecar.yaml"