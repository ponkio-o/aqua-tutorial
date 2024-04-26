FROM debian:bookworm-20231009

LABEL org.opencontainers.image.source=https://github.com/ponkio-o/aqua-tutorial
LABEL org.opencontainers.image.description="The tutorial container for aquaproj/aqua"

RUN apt-get -y update \
    && apt-get -y install curl vim \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

WORKDIR /root/workspace

ENV XDG_DATA_HOME /root/.local/share
ENV PATH ${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH
RUN curl -sSfL -O https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.25.1/aqua-installer
RUN chmod +x aqua-installer
RUN ./aqua-installer

ENTRYPOINT ["/bin/bash"]
