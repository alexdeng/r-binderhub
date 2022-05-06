FROM gcr.io/binderhub-288415/r2d-staging-g5b5b759-binder-2dexamples-2dr-974603:e6a2b236269ab7d8767509854420e053f783a9f6

USER root

# Install other system tools, nano and update git, quarto, code server, shiny
RUN curl --silent --location --fail https://github.com/quarto-dev/quarto-cli/releases/download/v0.9.355/quarto-0.9.355-linux-amd64.deb > /tmp/quarto.deb && \
    echo 'a784bbbba12cd0a30f520872933630dfdca78b7fc1703dc4d28894bfc3e0e768 /tmp/quarto.deb' | sha256sum -c - && \
    apt-get -qq update && \
    apt-get -qq install --yes --no-install-recommends \
    /tmp/quarto.deb \
    > /dev/null && \
    rm /tmp/*.deb && \
    apt-get -qq purge && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/*