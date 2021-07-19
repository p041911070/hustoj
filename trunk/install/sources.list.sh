#!/usr/bin/bash

codename=`cat /etc/os-release | grep UBUNTU_CODENAME | awk -F '=' '{print $2}'`

mv /etc/apt/sources.list /etc/apt/sources.list.bak

cat >/etc/apt/sources.list <<EOF
deb http://mirrors.163.com/ubuntu/ ${codename} main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ ${codename}-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ ${codename}-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ ${codename}-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ ${codename}-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ ${codename} main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ ${codename}-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ ${codename}-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ ${codename}-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ ${codename}-backports main restricted universe multiverse
EOF