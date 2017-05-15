# ubiquitous-happiness

This repo eventually plans to
spin up zcash-gitian on AWS from local machine
but very high chance I won't finish it.

I will change the repo name if it ever does anything worth sharing.

## Plans

Set up Ansible playbooks to run https://github.com/zcash/zcash-gitian on AWS

## Setup

### setup 'Manager' box with Ansible

3. (optional) Install vagrant on your local box
4. (optional) Create a VM to be Manager
5. Install Ansible on Manager (VM or physical machine)
1. Clone this repo into Manager
2. Run `./setup.sh`

The `./setup.sh` script will ask you for your AWS credentials.  It will also create ssh keys to allow you access to the server.

Run the playbooks in order

    ansible-playbook playbook-005-spin-up-vpc-and-server.yml
    ansible-playbook playbook-010-update-server-and-reboot.yml
    ansible-playbook playbook-015-install-zcash-requirements.yml
    ansible-playbook playbook-020-install-zcash-via-gitian.yml

Optionally, install the 800 pound gorilla who I love to have around

    ansible-playbook playbook-800-install-emacs.yml