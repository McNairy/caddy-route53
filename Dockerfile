# Stage 1: Build Caddy with the Route53 DNS plugin
FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/route53@v1.6.2

# Stage 2: Final image
FROM dhi.io/caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
