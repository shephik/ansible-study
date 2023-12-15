ping:
	ansible all -i inventory.ini -u kate -m ping

setup:
	ansible all -i inventory.ini -m setup

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

playbook-delete-vault:
	ansible-playbook playbook/playbook_delete.yml -i inventory.ini --ask-vault-pass

playbook-delete-vault-pass:
	ansible-playbook playbook/playbook_delete.yml -i inventory.ini --vault-password-file .vaultpass

playbook:
	ansible-playbook playbook/playbook.yml -i inventory.ini

.PHONY: playbook


playbook-roles:
	ansible-playbook playbook/playbook_roles.yml -i inventory.ini