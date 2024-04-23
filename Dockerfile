FROM alpine
WORKDIR /
COPY target/x86_64-unknown-linux-musl/release/leaf /tmp/
RUN chmod +x /tmp/leaf

RUN <<EOF cat >> /tmp/config.conf
[General]
loglevel = debug
socks-interface = 0.0.0.0
socks-port = 1080
[Proxy]
Direct = direct
EOF

ENTRYPOINT ["/tmp/leaf", "-c"]
CMD ["/tmp/config.conf"]
