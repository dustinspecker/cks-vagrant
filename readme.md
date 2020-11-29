# cks-vagrant

> Vagrantfile to create cluster for use with [Kubernetes CKS 2020 Complete Course + Simulator](https://www.udemy.com/course/certified-kubernetes-security-specialist/)

## Usage

1. [Install Vagrant](https://www.vagrantup.com/docs/installation)
1. Run `vagrant plugin install vagrant-disksize`

### Deploy cluster with latest kubernetes

1. Run `./deploy-latest.sh`

### Deploy cluster with previous kubernetes

1. Run `./deploy-previous.sh`

### Cleanup VMs

1. Run `./cleanup.sh`
