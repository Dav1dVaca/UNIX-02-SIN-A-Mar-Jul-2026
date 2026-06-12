#!/bin/bash

for ip_address in "$@"; do
    echo "Pinging ${ip_address}..."
    ping -c 4 "${ip_address}"
done

# 127.0.0.1 -> Localhost (the local machine itself)
# 8.8.8.8   -> Google's public DNS server
# 1.1.1.1   -> Cloudflare's public DNS server
# 9.9.9.9   -> Quad9 public DNS server