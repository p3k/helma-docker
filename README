# Dockerfile for Helma

This Dockerfile runs Helma version 1.7 and exposes her web port 8080 to the host.

Helma is a server-side Javascript environment and web application framework for fast and efficient scripting and serving of your websites and Internet applications.

[More information about Helma.](http://helma.org)

Invoke this command to start the container:

```
docker run -Pd piefke3000/helma-docker:1.7
```

To access the welcome app with your browser you first need to determine the IP address of the container:

```
$ docker ps -q
37d9eb2e7f8d
$ docker inspect --format '{{ .NetworkSettings.IPAddress }}' 37d9eb2e7f8d
172.17.0.8
```

_Note:_ Due to a virtual machine being used on Mac OS X this has to be done using `boot2docker`:

```
$ boot2docker ip

The VM's Host only interface IP address is: 192.168.59.103
```

Furthermore, you need to determine the host’s port to which Helma’s port 8080 is exposed to:

```
$ docker port 37d9eb2e7f8d 8080
0.0.0.0:49156
```

So the full address for accessing Helma is `172.17.0.8:49156` (or `192.168.59.103:49156`, resp.):

```
curl -I 172.17.0.8:49156
HTTP/1.1 200 OK
Set-Cookie: HopSession=192.168.59.98yzui6j4vu; Path=/; HttpOnly
ETag: "dNc0h+i6vLT3Lactts/sOg=="
Content-Length: 3011
Content-Type: text/html; charset=utf-8
Server: Jetty(6.1.22)
```

Have fun! :smile_cat:
