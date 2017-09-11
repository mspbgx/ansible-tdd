# Project: ansible-tdd (Test Driven Development)

## Install required packages
1. yum install python-devel python2-pip
2. pip install ansible
3. yum install ruby rubygems
4. gem install test-kitchen kitchen-docker kitchen-ansible

## Create an ansible role
1. Execute the create-role shell script: https://raw.githubusercontent.com/mspbgx/ansible-create-role/master/create-role.sh

## Test kitchen configuration
1. cd roles/{{ Role_Name }}/
2. kitchen init --driver=docker --provisioner=ansible_playbook

test/integration/default/default.yml
test/integration/default/serverspec/default_spec.rb
