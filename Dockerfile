# Stage 1: Build the custom Caddy binary
FROM caddy:2.11.2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/route53

# Stage 2: Create the final image
FROM caddy:2.11.2

# CRITICAL: Replace the default Caddy binary with your custom one
COPY --from=builder /usr/bin/caddy /usr/bin/caddy

