# DigitalOcean Droplet (template)

This is a template repo for creating a DigitalOcean Droplet and associated resources (project and VPC). It is not intended to be deployed directly, but rather used to create a new repo and the resulting module modified as needed for individual projects, reducing the need to write some boilerplate code from scratch every time.

Two assumptions are made in the template:

* All SSH keys present in the DigitalOcean account will be added to the Droplet.

* The `base` tag is added to the Droplet, for use with [a base firewall](https://github.com/NicholasPCole/terraform-digitalocean-base-firewall). The tag must be created; the firewall is optional.
