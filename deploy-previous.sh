#!/bin/bash
set -ex

INSTALL_SCRIPT=previous vagrant up

./join-node.sh
