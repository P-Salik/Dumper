#!/bin/bash

# Setup
mkdir -p /tmp/dump
cd /tmp/dump
export TZ=Asia/Kolkata
export DEBIAN_FRONTEND=noninteractive
apt install git curl python2 python3 python-pip wget -y
git clone https://github.com/P-Salik/DumprX dumper
./dumper/setup.sh

echo $GH_TOKEN >> dumper/.github_token 2>/dev/null
echo "P-Salik-Dumps" >> dumper/.github_orgname 2>/dev/null
echo $TG_TOKEN >> dumper/.tg_token 2>/dev/null
echo "-1001641837458" >> dumper/.tg_chat 2>/dev/null

git config --global user.name $GH_USERNAME
git config --global user.email $GH_USEREMAIL

# Dump
cd /tmp/dump/dumper
./dumper.sh $FIRMWARE_LINK
echo Done!
