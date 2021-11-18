FROM busybox
FROM gcr.io/kaniko-project/executor:v1.7.0

ENV PATH /bin
ENV HOME /root
ENV USER root
ENV SSL_CERT_DIR=/kaniko/ssl/certs
ENV DOCKER_CONFIG /kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG /kaniko/.config/gcloud/docker_credential_gcr_config.json

COPY --from=busybox / /

# add the wrapper which acts as a drone plugin
COPY plugin.sh /kaniko/plugin.sh

ENTRYPOINT [ "/kaniko/plugin.sh" ]
