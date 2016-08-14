use proxychains with socks proxy
================================

install proxychains
-------------------

- ubuntu/debain: `apt-get install proxychains`
- mac: `brew install proxychains-ng`

configure
---------

    vi ~/.proxychains/proxychains.conf

usage
-----

    proxychains4 curl https://www.google.com
    proxychains4 git pull origin master

or

    proxychains4 zsh
    git pull origin master

http proxy based on socks proxy
===============================

polipo socksParentProxy=localhost:1080
