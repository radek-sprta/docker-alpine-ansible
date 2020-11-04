# Alpine Ansible

## Quick reference
- **Maintained by**: [Radek Sprta](https://gitlab.com/radek-sprta)
- **Where to get help**: [Repository Issues](https://gitlab.com/radek-sprta/docker-alpine-ansible/-/issues)

## Description
Alpine container for Ansible playbook and role testing in Molecule.

## Usage
The simplest way to run the container is the following command:

```bash
docker run --detach --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro rsprta/alpine-ansible
```

Or in `molecule.yml`:

```yaml
platforms:
  - name: instance
    image: rsprta/alpine-ansible
    command: ""
    volumes:
      - "/sys/fs/cgroup:/sys/fs/cgroup:ro"
    pre_build_image: true
```

## Contact
- [mail@radeksprta.eu](mailto:mail@radeksprta.eu)
- [incoming+radek-sprta/docker-alpine-ansible@gitlab.com](incoming+radek-sprta/docker-alpine-ansible@gitlab.com)

## License
GNU General Public License v3
