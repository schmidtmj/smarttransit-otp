#
#
#Update and install basic tools
sudo yum -y update
sudo yum -y install git

#Install docker
sudo yum -y install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
#Exit and log back in to get usermod updated
docker info

#Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

#Get data
mkdir -p $WORKING/data/$SITE
wget $OSM_DATA -O $WORKING/data/$SITE

#Fetch otp from git
git clone https://github.com/schmidtmj/otp.git

#Fetch GTFS tools from git and install
mkdir -p $WORKING/gtfs/data/$SITE
popd $WORKING/gtfs
git clone -b fare-creator https://github.com/schmidtmj/osm2gtfs.git
git clone https://github.com/schmidtmj/osm2gtfs-prep.git

#EITHER RUN IN BASH OR RUN IN CONTAINER
docker-compose start gtfs-utility


popd osm2gtfs
pip install -e .
#Install

mkdir -p $WORKING/otp


#Get data for tools (OSM, GTFS schedule, other??)

#Run tools (Fare/Schedule utility, easy-timetable, OSMtoGTFS tool, others??)

#Run OTP
