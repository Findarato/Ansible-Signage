#!/bin/bash
cd /tmp
# create hosts
rm -f hosts
echo rpi-hsignage01.hardware >> hosts
echo rpi-tsignage01.hardware >> hosts
echo rpi-tsignage02.hardware >> hosts

# grab IP addresses from hosts
for node in $(cat hosts); do
  nslookup $node | grep 'Address\:' | awk 'NR==2 {print $2}' >> hosts
done

# add ssh keys for both hostname and ip for each host
for node in $(cat hosts); do
  ssh-keyscan -H $node >> ~/.ssh/known_hosts
  ssh-copy-id -i ~/.ssh/ansible.pub -o PreferredAuthentications=password -o PubkeyAuthentication=no pi@$node 

done

# Cleanup known_hosts for duplicate entries
sort -u ~/.ssh/known_hosts > ~/.ssh/known_hosts.clean
mv ~/.ssh/known_hosts ~/.ssh/known_hosts.backup
cp ~/.ssh/known_hosts.clean ~/.ssh/known_hosts
