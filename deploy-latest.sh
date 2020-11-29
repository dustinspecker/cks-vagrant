#!/bin/bash
set -ex

INSTALL_SCRIPT=latest vagrant up

./join-node.sh
