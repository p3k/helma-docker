# Dockerfile for Helma

This Dockerfile runs Helma version 1.7 and exposes her web port 8080 to the host.

Helma is a server-side Javascript environment and web application framework for fast and efficient scripting and serving of your websites and Internet applications.

[More information about Helma.](http://helma.org)

Invoke this command to start the container:

```
docker run -d -p 8080 piefke3000/helma-docker:1.7
```

The image is built using an [ENTRYPOINT](https://docs.docker.com/reference/builder/#entrypoint) in the Dockerfile. Thus, you can overwrite the default web port (8080) or add optional Helma switches:

```
Usage: java helma.main.Server [options]
Possible options:
  -a app[,...]      Specify applications to start
  -h dir            Specify hop home directory
  -f file           Specify server.properties file
  -c jetty.xml      Specify Jetty XML configuration file
  -w [ip:]port      Specify embedded web server address/port
  -x [ip:]port      Specify XML-RPC address/port
  -jk [ip:]port     Specify AJP13 address/port

Supported formats for server ports:
   <port-number>
   <ip-address>:<port-number>
   <hostname>:<port-number>
```

Here is an example for running Helma on port 80 and a custom configuration file for the Jetty webserver:

```
docker run -d -p 80 piefke3000/helma-docker:1.7 -w 80 -j /opt/helma/jetty.xml
```

To access the welcome app with your browser you first need to determine the IP address of the container:

```
$ docker ps -q
37d9eb2e7f8d
$ docker inspect --format '{{ .NetworkSettings.IPAddress }}' 37d9eb2e7f8d
172.17.0.8
```

_Note:_ On Mac OS X and Windows this has to be done using `boot2docker` due to a virtual machine being used as bridge between the operating system and the Docker containers:

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

Of course, this is quite some hassle, so it is also possible to map the container port to the same host port – you still need the container IP address though! – and access Helma via `172.17.0.8:8080` (or `192.168.59.103:8080`, resp.):

```
docker run -d -p 8080:8080 piefke3000/helma-docker:1.7
```

Have fun! :smile_cat:
