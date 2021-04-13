apt update -y && apt upgrade -y
apt install iputils-ping -y 
export TZ=America/Mexico_City
echo $TZ
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
apt-get -y install mtr 
ping guestbook.t-xperience.com -i 5 | while read pong; do echo $(date): $pong; done

#ubectl run mytwice --image=ubuntu --command -- /bin/bash -c 'while true; do echo -ne "`date`\r"; done'