config (/etc/polipo/config)
---------------------------

    logSyslog = true
    logFile = /var/log/polipo/polipo.log

    socksProxyType = socks5
    socksParentProxy = "localhost:1080"
    proxyAddress = "::0"
    allowedClients = 127.0.0.1, 172.17.0.0/24

start
-----

- debian

    /usr/lib/polipo/polipo-control start
