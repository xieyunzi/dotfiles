## kali linux

https://www.kali.org/news/official-kali-linux-docker-images/

kalilinux/kali-linux-docker

```bash
docker run -t -i kalilinux/kali-linux-docker /bin/bash
```


## metasploit

https://github.com/docker-linux/kali-metasploit

```bash
docker run -t -i linuxkonsult/kali-metasploit
```

To start the image and get into an interactive msfconsole shell:

```bash
docker run -t -i linuxkonsult/kali-metasploit
```

To run a joomla_plugins scan directly:

```bash
docker run -t -i linuxkonsult/kali-metasploit msfcli auxiliary/scanner/http/joomla_plugins RHOSTs=127.0.0.1 VHOST=example.com THREADS=3 E
```


## owasp-bricks

```bash
docker run -d -p 49998:80 owasp-bricks
```


## webgoat

```bash
docker run --rm -it -p 8888:80 webgoat2 java -jar /webgoat.jar  -httpPort 80
```

## imagemagick

```bash
docker run -v $PWD:/images -w /images --rm -it v4tech/imagemagick /bin/sh
```
