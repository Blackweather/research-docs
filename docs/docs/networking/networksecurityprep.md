# Linux Foundation Cert Prep: Network Security (Ubuntu) - LinkedIn Learning

## Ports

**Socket** - combination of address and port
**Port** - a logical space where a process can listen or send data

### Port ranges
<table>
    <tr>
        <th>Range</th>
        <th>Name</th>
        <th>Use</th>
    </tr>
    <tr>
        <td>0-1023</td>
        <td>Well-Known Ports</td>
        <td>Common services (e.g., 22: ssh, 80: http)</td>
    </tr>
    <tr>
        <td>1024-49151</td>
        <td>Registered Ports</td>
        <td>Unprivileged services (development servers)</td>
    </tr>
    <tr>
        <td>49152-65535</td>
        <td>Dynamic Ports</td>
        <td>Outgoing connections to other systems</td>
    </tr>
</table>

### Control of Ports
- a process can listen using TCP and/or UDP
- a process can control more than one port
- a port can only be used by one process at a time

## Firewalls
- Firewall software can allow or deny access to a system
- networks and individual systems can have firewalls
- firewall inserts itself between the network interface and the rest of the system
    - determines whether to permit traffic through
- rules determine what traffic can get through
- can control inbound and outbound traffic

### UFW - Uncomplicated Firewall
- meant to simplify setting up uncomplicated firewall rules
- sits on top of iptables

`ufw status` - check if active + rules
`ufw enable` - activate the firewall
`ufw allow 22/tcp` - allow access to ssh

Result:
```
root@kszczepanski2c:~# ufw status
Status: active

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW       Anywhere
22/tcp (v6)                ALLOW       Anywhere (v6)
```

Delete the second rule (IPv6 connection): `ufw delete 2`

`ufw deny 22/tcp` - deny access to ssh (same effect as deleting)

Result:
```
root@kszczepanski2c:~# ufw status
Status: active

To                         Action      From
--                         ------      ----
22/tcp                     DENY        Anywhere
22/tcp (v6)                DENY        Anywhere (v6)
```

`ufw delete deny 22/tcp` 

#### UFW - applications
`ufw app list` - show installed applications

`ufw app info "<App name>" -> ufw app info "Nginx Full"` - get info about an application

Result:
```
root@kszczepanski2c:~# ufw app info "Nginx Full"
Profile: Nginx Full
Title: Web Server (Nginx, HTTP + HTTPS)
Description: Small, but very powerful and efficient web server

Ports:
  80,443/tcp
```

`ufw allow from 10.0.2.0/24 to 10.0.2.10 app OpenSSH`

#### Block external DNS for Clients
Filter out external DNS queries for clients on our network
```
ufw allow from 10.0.2.0/24 to 10.0.2.10 port 53 proto tcp
ufw allow from 10.0.2.0/24 to 10.0.2.10 port 53 proto udp
```

#### UFW - limitations
UFW can't do some things directly from the command line:

- confiuguring forwarding
- setting up conditional chains of rules

UFW stores rules in `/etc/ufw/`
```
root@kszczepanski2c:~# ls -l /etc/ufw
total 48
-rw-r----- 1 root root 1126 Sep 12  2018 after.init
-rw-r----- 1 root root 1004 Aug 17  2017 after.rules
-rw-r----- 1 root root  915 Aug 17  2017 after6.rules
drwxr-xr-x 2 root root 4096 Mar 11  2019 applications.d
-rw-r----- 1 root root 1130 Sep 12  2018 before.init
-rw-r----- 1 root root 2537 Mar 25  2019 before.rules
-rw-r----- 1 root root 6700 Mar 25  2019 before6.rules
-rw-r--r-- 1 root root 1391 Aug 15  2017 sysctl.conf
-rw-r--r-- 1 root root  313 Jan 11 10:47 ufw.conf
-rw-r----- 1 root root 1531 Jan 11 10:48 user.rules
-rw-r----- 1 root root 1293 Jan 11 10:47 user6.rules
```

`user.rules` - rules added through command line

## Iptables
- firewall software
- uses rules combined into chains
- packets are compared to rules, and if there's a match, an action is taken
- if no match, a default action is taken
- chains allow for conditional evaluation

### Standard chains
- INPUT - packets flowing into the system
- FORWARD - packets transiting the system
- OUTPUT - packets flowing out of the system

### Standard actions
- ALLOW - permits packet to pass through
- DROP - ignores packet, the connection will be timed out
- REJECT - actively denies packet, the client that is trying to connect will be immediately notified that the connection is not possible

### Commands
- `iptables -L -n` - show all chains
- `iptables -L --line-numbers` - show chains with line numbers
- `iptables-save > myrules` - save all rules to a file
- `iptables-restore myrules` - load rules from a file
- `iptables -F` - delete all rules
- `iptables -D [chain] [number]` - delete a specific rule

#### Adding a rule
`iptables -A <chain> -p <protocol> --dport <port> -j <target>`
For example: `iptables -A INPUT -p tcp --dport 80 -j ACCEPT`

target can be:

- ACCEPT - allow the packet through to wherever it's trying to get
- DROP
- RETURN
- different chain

#### Additional parameters:
- restrict access to a (source) network address or range
    - `-A INPUT -s 10.0.2.0/24 -j ACCEPT`
- match a state (NEW, ESTABLISHED, RELATED)
    - `-A INPUT -m state -state NEW -j ACCEPT`
    - NEW - packets that haven't been associated with a connection before
- only act on one interface
    - `-A INPUT -i enp0s3 -j ACCEPT`

## Securing with SSL
- certificate and key that encrypt data between client and server
- certificate can vouch for authenticity of a server

### Types of Certificates
- CA-signed 
    - certificate authority "signs" or indicates a chain of trust for the site
    - usually costs a little bit of money (Let's Encrypt is free)
- self-signed
    - has no trust relationship (but still encrypts information)
    - fine for testing but should never be used in production

#### Generating a Self-Signed Certificate
```
openssl req -x509   # self signed vs. CSR
 -newkey rsa:2048  # algorithm and bits
 -keyout key.key   # path to private key
 -out cert.pem     # path to cert
 -days 365         # validity
 -nodes            # No DES - no password
```