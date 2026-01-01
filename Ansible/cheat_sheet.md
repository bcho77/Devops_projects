# Frequently Used Ansible Command-Line Tools

## Basic Commands

1. `ansible --version` – Show Ansible version
2. `ansible localhost -m ping` – Test Ansible setup
3. `ansible all -m ping` – Ping all hosts
4. `ansible-inventory --list` – Show inventory
5. `ansible-inventory --graph` – Display inventory graphically

## Running Modules

6. `ansible all -m shell -a 'uptime'` – Run shell command
7. `ansible all -m command -a 'ls -l'` – Run command module
8. `ansible all -m yum -a 'name=nginx state=present'` – Install package
9. `ansible all -m service -a 'name=nginx state=started'` – Start service
10. `ansible all -m copy -a 'src=/local/file dest=/remote/file'` – Copy file
11. `ansible all -m fetch -a 'src=/remote/file dest=/local/dir'` – Fetch file
12. `ansible all -m user -a 'name=john state=present'` – Manage user
13. `ansible all -m file -a 'path=/tmp/test state=directory'` – Create directory
14. `ansible all -m git -a 'repo=https://github.com/example.git dest=/path'` – Clone repo

## Running Playbooks

15. `ansible-playbook playbook.yml` – Run playbook
16. `ansible-playbook -i inventory playbook.yml` – Specify inventory
17. `ansible-playbook playbook.yml --check` – Dry run
18. `ansible-playbook playbook.yml --diff` – Show changes
19. `ansible-playbook playbook.yml -l webservers` – Limit hosts
20. `ansible-playbook playbook.yml -t install` – Run specific tag
21. `ansible-playbook playbook.yml -u user` – Specify remote user
22. `ansible-playbook playbook.yml --ask-become-pass` – Ask for sudo password

## Configuration & Vault

23. `ansible-config list` – Show configuration
24. `ansible-config dump` – Dump full config
25. `ansible-vault create secret.yml` – Create encrypted file
26. `ansible-vault encrypt secret.yml` – Encrypt file
27. `ansible-vault decrypt secret.yml` – Decrypt file
28. `ansible-vault edit secret.yml` – Edit encrypted file
29. `ansible-vault view secret.yml` – View encrypted file

## Galaxy & Roles

30. `ansible-galaxy install geerlingguy.nginx` – Install role
31. `ansible-galaxy list` – List installed roles
32. `ansible-galaxy remove geerlingguy.nginx` – Remove role
33. `ansible-galaxy init my_role` – Create new role

## Advanced & Debugging

34. `ansible-playbook playbook.yml -vvv` – Verbose mode
35. `ansible-playbook playbook.yml --start-at-task='Install Nginx'` – Start at task
36. `ansible-playbook playbook.yml --step` – Step through tasks
37. `ansible-playbook playbook.yml --list-tasks` – List all tasks
38. `ansible-playbook playbook.yml --list-tags` – List all tags
39. `ansible-doc -l` – List available modules
40. `ansible-doc yum` – Show module documentation

---

*This markdown file lists commonly used Ansible commands for system automation, configuration management, and deployment tasks.*
