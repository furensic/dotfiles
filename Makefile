run-playbook:
	ansible-playbook --ask-become -i ansible/inventory.ini ansible/main.yaml