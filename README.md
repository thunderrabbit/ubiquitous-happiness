# ubiquitous-happiness

This repo eventually plans to
spin up zcash-gitian on AWS from local machine
but very high chance I won't finish it.

I will change the repo name if it ever does anything worth sharing.

## Plans

Set up Ansible playbooks to run https://github.com/zcash/zcash-gitian on AWS

## Setup

### setup AWS user

Visit https://console.aws.amazon.com/iam/home?region=us-west-1#/users

Create a new user with Policy `AmazonEC2FullAccess`

Make note of the Security credentials for this user.  They will be needed when you run `./setup.sh`.

### setup 'Manager' box with Ansible

3. (optional) Install vagrant on your local box
4. (optional) Create a VM to be Manager
5. Install Ansible on Manager (VM or physical machine)
1. Clone this repo into Manager
2. Run `./setup.sh`

The `./setup.sh` script will ask you for your AWS credentials.  It will also create ssh keys to allow you access to the server.

Run the playbooks in order

    ansible_playbook playbook_005_spin_up_vpc_and_server.yml
    ansible_playbook playbook_010_update_server_and_reboot.yml
    ansible_playbook playbook_020_install_zcash_requirements.yml
    ansible_playbook playbook_025_install_zcash_via_gitian.yml

Optionally, install the 800 pound gorilla who I love to have around

    ansible_playbook playbook_800_install_emacs.yml