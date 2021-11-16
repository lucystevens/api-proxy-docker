FROM haproxy:2.3

ARG API_PORT
ARG UI_PORT
ARG LOCALHOST=host.docker.internal
ARG API_HOST=${LOCALHOST}
ARG UI_HOST=${LOCALHOST}

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
RUN sed -i "s/%API_PORT%/$API_PORT/" /usr/local/etc/haproxy/haproxy.cfg
RUN sed -i "s/%UI_PORT%/$UI_PORT/" /usr/local/etc/haproxy/haproxy.cfg
RUN sed -i "s/%API_HOST%/$API_HOST/" /usr/local/etc/haproxy/haproxy.cfg
RUN sed -i "s/%UI_HOST%/$UI_HOST/" /usr/local/etc/haproxy/haproxy.cfg
RUN echo "" >> /usr/local/etc/haproxy/haproxy.cfg