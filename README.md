# kivy & buildozer on ubuntu:precise

First of all, install Docker: https://docs.docker.com/installation/windows/ and git.

Build image:

```
$ git clone https://github.com/dmkurilov/docker-kivy-pricise.git
$ cd docker-kivy-precise
$ sudo docker build -t kivy:v1 .
```

Now run container (change `IP` on your IP-address`):

```
$ sudo docker run -t -i -p IP:22:22 --name kivy kivy:v1 /bin/bash
# /usr/sbin/sshd
```

Connect from everywhere to server and add user:

```
$ ssh root@IP
# adduser student
```

Well, now students can connect to server and build their apps:

```
$ ssh student@IP
$ mkdir surname
$ cd surname
$ #hack-hack-hack
$ buildozer init
$ mcedit buildzoer.spec  # change version, change API to 16
$ buildozer -v android
```
