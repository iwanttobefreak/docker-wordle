FROM debian

RUN apt-get update && \
    apt-get install -y curl locales

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

COPY vocales.sh /
COPY wordle.sh /
WORKDIR /
RUN ./vocales.sh

ENTRYPOINT ["/bin/bash", "-c", "/wordle.sh \"$@\"", "--"]
