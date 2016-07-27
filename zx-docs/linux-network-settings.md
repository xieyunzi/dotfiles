No inet address in ifconfig using eth1
======================================

problem like this:
------------------

    $ ifconfig

    eth1     Link encap:Ethernet HWaddr 00::50:fc:1b:94:2c
             inet6 addr: fe80::250:fcff:fe1b:942c/64 Scope:Link
             UP BROADCAST RUNNING MULTICAST MTU 1500 METRIC: 1
             RX packets:0 errors:0 dropped:0 overruns:0 frame:0
             TX packets:0 errors:51 dropped:0 overruns:0 carrier:102
             collisions:867 txqueuelen:1000
             RX bytes:0 (0.0 B) TX bytes:15858 (15.8 KB)
             Interrupt:5 Base address:0xe800

fix this:
---------

To start you don't have your loop back. Make sure your `/etc/network/interfaces` looks like this:

    # This file describes the network interfaces available on your system
    # and how to activate them. For more information, see interfaces(5).

    # The loopback network interface
    auto lo
    iface lo inet loopback

    # The primary network interface
    auto eth1
    iface eth1 inet dhcp

Then restart the network:

    sudo service networking restart

Then post again the result of 'ifconfig'. Please use the code tags (#) available when replying, when pasting command results (it is easier to read )
