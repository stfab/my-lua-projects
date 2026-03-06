FROM alpine:latest

# install dev tools and lua
RUN apk update && \
    apk add --no-cache lua lua-dev luarocks gcc musl-dev make gnuplot

# install additional libs
# RUN luarocks install luafilesystem

# set dev env
WORKDIR /app
COPY . .
