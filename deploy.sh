#!/usr/bin/env bash
AP=$(which ansible-playbook)
AG=$(which ansible-galaxy)

$AG install -r ./requirements.yml
$AP ./deploy.yml --flush-cache -i ./hosts
