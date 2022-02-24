FROM debian

RUN apt-get update && \
    apt-get install -y curl

COPY vocales.sh /
COPY wordle.sh /
WORKDIR /
RUN ./vocales.sh

#CMD bash
ENTRYPOINT ["/bin/bash", "-c", "/wordle.sh \"$@\"", "--"]
