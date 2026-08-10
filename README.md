# Homelab

## Services

- Portainer: For handling docker containers through a web UI
- Pihole: DNS Blocker + DNS. Essentially blocks unwanted domains and can establish new domains within the local network. You must edit the configurations in the router to put it as the primary DNS
- Grocy: Grocery and household inventory manager

## Access

All services are accessible through the local DNS name `homelab.pi` (mapped to the Raspberry Pi via a Pi-hole local DNS record), followed by their port:

| Service   | URL                       |
| --------- | ------------------------- |
| Portainer | http://homelab.pi:9000    |
| Pi-hole   | http://homelab.pi:80/admin |
| Grocy     | http://homelab.pi:9283    |
