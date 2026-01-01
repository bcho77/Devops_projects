# 100 Frequently Used DevOps Command-Line Tools

## Git & Version Control

1. `git init` – Initialize a Git repository
2. `git clone` – Clone a repository
3. `git add` – Add files to staging
4. `git commit` – Commit changes
5. `git status` – Show status of repo
6. `git log` – Show commit history
7. `git diff` – Show differences
8. `git branch` – List branches
9. `git checkout` – Switch branches
10. `git merge` – Merge branches
11. `git pull` – Pull changes
12. `git push` – Push changes
13. `git remote -v` – Show remotes
14. `git stash` – Temporarily save changes
15. `git tag` – Tag a commit

## Docker & Containers

16. `docker ps` – List running containers
17. `docker ps -a` – List all containers
18. `docker images` – List images
19. `docker pull` – Pull image from registry
20. `docker run` – Run a container
21. `docker exec` – Execute command in container
22. `docker stop` – Stop container
23. `docker start` – Start container
24. `docker rm` – Remove container
25. `docker rmi` – Remove image
26. `docker logs` – View container logs
27. `docker build` – Build image
28. `docker network ls` – List networks
29. `docker network inspect` – Inspect network
30. `docker-compose up` – Start services
31. `docker-compose down` – Stop services

## Kubernetes & Orchestration

32. `kubectl get pods` – List pods
33. `kubectl get svc` – List services
34. `kubectl get nodes` – List nodes
35. `kubectl describe pod <pod>` – Show pod details
36. `kubectl logs <pod>` – View pod logs
37. `kubectl exec -it <pod> -- bash` – Enter pod shell
38. `kubectl apply -f <file>` – Apply configuration
39. `kubectl delete -f <file>` – Delete resources
40. `kubectl scale` – Scale deployment
41. `kubectl port-forward` – Forward ports
42. `kubectl rollout status` – Deployment status
43. `kubectl get deployments` – List deployments
44. `helm install` – Install chart
45. `helm upgrade` – Upgrade release
46. `helm list` – List releases

## CI/CD & Automation

47. `jenkins-cli` – Jenkins command line
48. `ansible --version` – Show Ansible version
49. `ansible all -m ping` – Test connectivity
50. `ansible-playbook <playbook>` – Run playbook
51. `terraform init` – Initialize Terraform
52. `terraform plan` – Preview changes
53. `terraform apply` – Apply configuration
54. `terraform destroy` – Destroy infrastructure
55. `packer build` – Build machine image
56. `vault status` – HashiCorp Vault status
57. `vault login` – Authenticate with Vault

## Monitoring & Logging

58. `top` – View processes
59. `htop` – Interactive process viewer
60. `dstat` – System resource stats
61. `vmstat` – Virtual memory stats
62. `iostat` – Disk I/O stats
63. `sar` – System activity report
64. `netstat` – Network connections
65. `ss` – Socket stats
66. `journalctl` – Systemd logs
67. `tail -f /var/log/syslog` – Monitor logs
68. `docker logs -f <container>` – Container logs
69. `kubectl logs -f <pod>` – Pod logs
70. `prometheus` – Monitoring metrics
71. `grafana-cli` – Grafana management

## Cloud & Infrastructure

72. `aws s3 ls` – List S3 buckets
73. `aws s3 cp` – Copy files to/from S3
74. `aws ec2 describe-instances` – EC2 info
75. `aws ec2 start-instances` – Start EC2
76. `aws ec2 stop-instances` – Stop EC2
77. `aws cloudformation deploy` – Deploy stack
78. `az vm list` – List Azure VMs
79. `az vm start` – Start Azure VM
80. `az vm stop` – Stop Azure VM
81. `gcloud compute instances list` – GCP VMs
82. `gcloud compute ssh` – SSH to GCP VM

## Networking & Security

83. `ping` – Test connectivity
84. `traceroute` – Trace route
85. `curl` – Test HTTP requests
86. `wget` – Download files
87. `netcat` – Test TCP/UDP connections
88. `iptables -L` – List firewall rules
89. `ufw status` – Firewall status
90. `ssh user@host` – Remote SSH
91. `scp file user@host:/path` – Copy files
92. `rsync -avz` – Sync files

## Package Management & System

93. `apt update` – Update repo (Debian)
94. `apt upgrade` – Upgrade packages
95. `yum update` – Update repo (RHEL)
96. `systemctl start <service>` – Start service
97. `systemctl stop <service>` – Stop service
98. `systemctl status <service>` – Service status
99. `systemctl enable <service>` – Enable service
100. `systemctl disable <service>` – Disable service

---

*This markdown file lists commonly used DevOps command-line tools for version control, containers, orchestration, CI/CD, monitoring, cloud, and system administration.*
