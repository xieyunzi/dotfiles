# use proxychains with socks proxy

## install proxychains

- ubuntu/debain: `apt-get install proxychains`
- mac: `brew install proxychains-ng`

## configure

```sh
$ vi ~/.proxychains/proxychains.conf
```

## usage

```sh
proxychains4 curl https://www.google.com
proxychains4 git pull origin master

# or

proxychains4 zsh
curl git pull origin master
```
