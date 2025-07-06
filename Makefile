run-playbook:
	ansible-playbook --ask-become -i ansible/inventory.ini ansible/playbooks/main.yaml