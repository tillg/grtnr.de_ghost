# grtnr.de on AWS

## Fact sheet

Instance for the grtnr.de services:

* Created on May 31st 2020, while sitting at Tauglboden 😀
* Instance ID: i-0b05b720488af0d65
* Instance type: t2.medium
* Private IPs: 172.31.19.234
* Launch time: May 31, 2020 at 2:09:04 PM UTC+2
* SSH Access: `ssh ubuntu@18.184.35.58` (as of May 31st, that is before attribuing the Elastic IP)

## Installed packages

The following packages neede to be installed:

* **Docker** `sudo apt install docker.io`, for more details check [here](https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04). Also I needed to modify the rights like [here](https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket)
* 