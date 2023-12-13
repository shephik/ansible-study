ping:
	ansible all -i inventory.ini -u kate -m ping

TAGS ?=

playbook-features-check:
ifdef TAGS
	ansible-playbook --check playbook/playbook_ansible_features.yml -i inventory.ini -t $(TAGS)
else
	ansible-playbook --check playbook/playbook_ansible_features.yml -i inventory.ini
endif

playbook-features-check-skip-tags:
	ansible-playbook --check playbook/playbook_ansible_features.yml -i inventory.ini --skip-tags $(TAGS)

playbook-features:
ifdef TAGS
	ansible-playbook playbook/playbook_ansible_features.yml -i inventory.ini -t $(TAGS)
else
	ansible-playbook playbook/playbook_ansible_features.yml -i inventory.ini
endif


playbook-nginx:
ifdef TAGS
	ansible-playbook playbook/playbook_nginx.yml -i inventory.ini -t $(TAGS)
else
	ansible-playbook playbook/playbook_nginx.yml -i inventory.ini
endif
	

playbook-users:
	ansible-playbook playbook/playbook_users.yml -i inventory.ini


playbook-delete:
	ansible-playbook playbook/playbook_delete.yml -i inventory.ini


playbook:
	ansible-playbook playbook/playbook.yml -i inventory.ini

.PHONY: playbook