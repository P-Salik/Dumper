#!/bin/bash

# Setup
mkdir -p /tmp/dump
cd /tmp/dump
export TZ=Asia/Kolkata
export DEBIAN_FRONTEND=noninteractive
apt-get install git curl python2 python3 wget aria2 -y
git clone https://github.com/P-Salik/dumpyara
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python2 get-pip.py
pip install --upgrade pip
pip install setuptools wheel docopt pycryptodome zip
./dumpyara/setup.sh

echo $GH_TOKEN >> dumpyara/.githubtoken 2>/dev/null
echo $TG_TOKEN >> dumpyara/.tgtoken 2>/dev/null

git config --global user.name $GH_USERNAME
git config --global user.email $GH_USEREMAIL

# Dump
cd /tmp/dump/dumpyara
./dumpyara.sh $FIRMWARE_LINK
echo Done!
