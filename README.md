# aria2
Aria2 image on alpine

Forked from [opengg/docker-aria2](https://github.com/OpenGG/docker-aria2)

## Usage

0. Prepare config and download directories with following commands.

    ```bash
    # Create config dir
    mkdir /storage/aria2/config

    # Set proper permissions. Change 1001:1002 to your own uid:gid .
    chown -R 82:82 /storage/aria2/config

    find /storage/aria2/config -type d -exec chmod 755 {} +
    find /storage/aria2/config -type f -exec chmod 644 {} +

    # Create download dir
    mkdir /storage/aria2/downloads

    # Set proper permissions. Change 1001:1002 to your own uid:gid .
    chown -R 82:82 /storage/aria2/downloads
    find /storage/aria2/downloads -type d -exec chmod 755 {} +
    find /storage/aria2/downloads -type f -exec chmod 644 {} +
    ```
0. Put `aria2.conf` file in the config dir, with following content.

    ```ini
    save-session=/config/aria2.session
    input-file=/config/aria2.session
    save-session-interval=60

    dir=/downloads

    file-allocation=prealloc
    disk-cache=128M

    enable-rpc=true
    rpc-listen-port=6800
    rpc-allow-origin-all=true
    rpc-listen-all=true

    rpc-secret=<password>

    auto-file-renaming=false

    max-connection-per-server=16
    min-split-size=1M
    split=16
    ```
0. Run following command to start aria2 instance

    ```bash
    # Change 1001:1002 to your own uid:gid .
    docker run \
      -d \
      --name aria2 \
      -v /storage/aria2/config:/config \
      -v /storage/aria2/downloads:/downloads \
      -p 6800:6800 \
      opengg/aria2
    ```

Note:
* `aria2.conf` will be created automatically if not exists and secret will be generated.
* Learn more about tuning `aria2.conf`: [Config reference](https://aria2.github.io/manual/en/html/aria2c.html#aria2-conf)

## Parameters

The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
`http://192.168.x.x:8080` would show you what's running INSIDE the container on port 80.


* `-p 6800:6800` - the port(s)
* `-v /storage/aria2/config:/config` - where aria2 should store config files and logs
* `-v /storage/aria2/downloads:/downloads` - local path for downloads

It is based on alpine linux, for shell access whilst the container is running do `docker exec -it opengg/aria2 /bin/sh`.
