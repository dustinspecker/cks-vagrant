#!/bin/bash
set -ex

join_command="$( \
  vagrant ssh cks-master --command 'sudo kubeadm token create --print-join-command --ttl 0' \
    2>/dev/null \
  | grep warning \
    --ignore-case \
    --invert-match
)"

# %%[[:space:]] removes trailing whitespace
vagrant ssh cks-worker --command "sudo ${join_command%%[[:space:]]}"
