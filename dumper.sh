#!/bin/bash

# Setup
mkdir -p /tmp/dump
cd /tmp/dump
export TZ=Asia/Kolkata
export DEBIAN_FRONTEND=noninteractive
apt-get install git curl python python3 wget aria2 -y
git clone https://github.com/P-Salik/phoenix_firmware_dumper
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python2 get-pip.py
pip install --upgrade pip
pip install setuptools wheel docopt pycryptodome zip
./phoenix_firmware_dumper/setup.sh

echo $GH_TOKEN >> phoenix_firmware_dumper/.github_token 2>/dev/null
echo $GH_ORG >> phoenix_firmware_dumper/.github_orgname 2>/dev/null
echo $TG_TOKEN >> phoenix_firmware_dumper/.tg_token 2>/dev/null
echo $TG_CHAT >> phoenix_firmware_dumper/.tg_chat 2>/dev/null

git config --global user.name $GH_USERNAME
git config --global user.email $GH_USEREMAIL

# Dump
cd /tmp/dump/phoenix_firmware_dumper
./dumper.sh $FIRMWARE_LINK
echo Done!
