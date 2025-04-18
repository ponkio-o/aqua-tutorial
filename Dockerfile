FROM debian:bookworm-20231009

ARG AQUA_INSTALLER_VERSION=v3.1.2

LABEL org.opencontainers.image.source=https://github.com/ponkio-o/aqua-tutorial
LABEL org.opencontainers.image.description="The tutorial container for aquaproj/aqua"

RUN apt-get -y update \
    && apt-get -y install curl vim \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

WORKDIR /root/workspace

RUN curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/$AQUA_INSTALLER_VERSION/aqua-installer
RUN chmod +x aqua-installer
RUN ./aqua-installer
RUN rm aqua-installer

ENV XDG_DATA_HOME=/root/.local/share
ENV PATH=$PATH:$XDG_DATA_HOME/aquaproj-aqua/bin

ENTRYPOINT ["/bin/bash"]
