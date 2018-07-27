# docker-tippecanoe
This is a Docker image for [Mapbox's Tippecanoe](https://github.com/mapbox/tippecanoe), based on Alpine Linux.

The currently built version at the `latest` tag is `1.30.1`.

## Usage
Run with `docker run`, mounting a local directory or use Docker volumes as needed wth `-v`. See below for specific examples.
By default, processes will be run with the `tippecanoe` user in its home directory: `/home/tippecanoe`.

### Show tippecanoe version
Default command shows tippecanoe version.
```shell
docker run --rm shuntak/tippecanoe
```

### Interactive Mode with `sh (ash)`
Bash is not installed.
```shell
docker run -it --rm shuntak/tippecanoe /bin/sh
```

### Non-interactive: Directly Invoke Tippecanoe
Alternatively, you can run `tippecanoe` directly.
This is more useful in a script running on the host.
```shell
docker run -it -v `pwd`:/home/tippecanoe --rm shuntak/tippecanoe tippecanoe -o output.mbtiles input.geojson
```

## Building A Different Version
To build a different version of Tippecanoe, set the `TIPPECANOE_RELEASE` build-arg
when building the image:
```shell
docker build --build-arg TIPPECANOE_RELEASE=1.30.0 .
```

Note that different versions may have different dependency requirements, so the build may fail,
or the build output may be broken.
