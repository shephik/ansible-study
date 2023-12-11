ping:
	ansible all -i inventory.ini -u kate -m ping

.PHONY: ping