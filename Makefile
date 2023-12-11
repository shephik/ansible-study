ping:
	ansible all -i inventory.ini -u kate -m ping

TAGS ?=

playbook-check:
ifdef TAGS
	ansible-playbook --check playbook/playbook.yml -i inventory.ini -t $(TAGS)
else
	ansible-playbook --check playbook/playbook.yml -i inventory.ini
endif

playbook-check-skip-tags:
	ansible-playbook --check playbook/playbook.yml -i inventory.ini --skip-tags $(TAGS)

playbook:
ifdef TAGS
	ansible-playbook playbook/playbook.yml -i inventory.ini -t $(TAGS)
else
	ansible-playbook playbook/playbook.yml -i inventory.ini
endif

.PHONY: playbook

playbook-skip-tags:
	ansible-playbook --check playbook/playbook.yml -i inventory.ini --skip-tags $(TAGS)


playbook-nginx:
ifdef TAGS
	ansible-playbook playbook/playbook_nginx.yml -i inventory.ini -t $(TAGS)
else
	ansible-playbook playbook/playbook_nginx.yml -i inventory.ini
endif
	
