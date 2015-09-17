# Nginx Proxy Docker Container

This is a very simple reverse proxy using nginx. It supports loading static
assets if they are in its document root, and proxies everything else.

## Usage

    $ docker run -d --name webapp example:latest
    $ docker run \
      --link webapp \
      -p 8080:8080 \
      -e BACKEND=http://webapp:3000 \
      d11wtq/nginx:1.9.4

