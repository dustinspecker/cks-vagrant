#!/bin/bash
set -ex

bash <( \
  curl --silent "https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/${INSTALL_SCRIPT}/install_master.sh" \
  | sed 's|kubeadm init|& --apiserver-advertise-address 192.168.5.10 --pod-network-cidr 10.32.0.0/12|' \
)
