Docker for CameraProxy using supervisord.

## Usage

```
docker create \
	--name cameraproxy \
	-p 44456:44456 \
	-p 44454:44454 \
	-v /etc/localtime:/etc/localtime:ro \
	-v </path/to/appdata>:/config \
	mezz64/cameraproxy
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


* `-p 44456` - the port cameraproxy webinterface
* `-p 44454` - the port cameraproxy websocket
* `-v /config` - database and sonarr configs
* `-v /etc/localtime` for timesync - see [Localtime](#localtime) for important information
* `-e TZ` for timezone information, Europe/London - see [Localtime](#localtime) for important information


## Localtime

It is important that you either set `-v /etc/localtime:/etc/localtime:ro`, mono will throw exceptions without this set.

## Setting up the application
Access the webui at `<your-ip>:44456/admin`.

## Info

* Monitor the logs of the container in realtime `docker logs -f cameraproxy`.
