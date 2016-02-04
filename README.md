# kivy & buildozer on ubuntu:precise

First of all, install Docker: https://docs.docker.com/installation/windows/ and git.

Build image:

```
$ git clone https://github.com/Teketel/docker-kivy-pricise.git
$ cd docker-kivy-precise
$ sudo docker build -t kivy:v1 .
```

Now run container 
```
$ sudo docker run -it --name kivy kivy:v1 /bin/bash
