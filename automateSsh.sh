# Automate the generation and distribution of keys
# https://www.ibm.com/developerworks/community/blogs/kevgrig/entry/automating_server_administration_with_ssh_keys?lang=en
#
mkdir ~/.ssh
mkdir ~/.ssh && chmod 700 ~/.ssh && cd ~/.ssh/
if [! -f $HOME/.ssh/ansible.pub]
	ssh-keygen -t rsa -b 4096 -f ~/.ssh/ansible
fi
ssh-copy-id -i ~/.ssh/ansible.pub user@host
ssh-add ~/.ssh/ansible.pub
