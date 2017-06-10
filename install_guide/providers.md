# List of recommended server providers

There is a topic on the official forums for posting server requests [https://forum.minetest.net/viewtopic.php?f=10&t=15093](https://forum.minetest.net/viewtopic.php?f=10&t=15093)

You should be able to find someone to host you for free on some spare space on their own servers.

The following list is intended to be suggestions of pay-for services that are both suitable for hosting minetest, and affordable for hobbyists.

Some DNS providers are also there if you want a dynamic name for a dynamically chaning IP address

## DNS

You can give your host a domain name instead of only having the raw IP address to give out. Purchasing domain names costs money, here's how to do it free:

### DuckDNS

* Go to DuckDNS
* Choose a name to use - for example `my-minetest` would become `my-minetest/duckdns.org`
* if necessary configure the IP you want the name to point to - by default it uses your own public IP

## Hosting

### At Home

Hosting at home is not yet covered by this guide.

### DigitalOcean

Suggested by: Taikedz

You can use the entry-level droplet VPS at 20GB storage, 1 CPU, 512 MB RAM and 1TB of transfer.

This will cost you $5 USD per month, though if you only run it for 2 week, it'll cost you $2.50 etc, down to pricing by-the-hour.

The disks are SSD and the CPUs run at 2GHz or so, so it's pretty fast. Add 2GB of swap and you'll have some decent performance with plenty of players (~30?) so long as the mods themselvesa are not highly intensive (`technic`, `mesecons`, `fun_caves` are fairly intensive, limit the number of users to perhaps 10 or so)

### Amazon AWS Lightsail

Suggested by: Taikedz

In simlar vein to DigitalOcean, Amazon Lightsail offers similar sizes at similar prices.
