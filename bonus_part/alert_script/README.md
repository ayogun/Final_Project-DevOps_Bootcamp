## Alert.sh

This script has planned to be schedully work every minute thanks to cron. It checks every minute if any of partitions or disks use exceed the 90% threshold value; and send an email to the specified user about alert. In my script it has been set as `proteindevops@gmail.com` but needs to be replaced according to user needs.

In order to use this script in your system, you may need some services to be installed. You should install mailutils and ssmtp services. You can use the commands below:

```bash

sudo apt-get update
sudo apt-get -y install mailutils
apt-get install ssmtp -y

```

You should make necessary configuration. In order to do that, you should go to ssmtp.conf file and replace the variables inside the configuration file. This configuration file has been prepared for GMAIL SSMTP SERVER. If you want to use another e-mail service provider, you should change the ssmtp address and of course your credentials. THe configuration file might be accessed with:

```bash

nano /etc/ssmtp/ssmtp.conf 

```

