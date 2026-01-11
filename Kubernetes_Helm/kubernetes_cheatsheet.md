# Kubernetes (kubectl) Cheatsheet

## Cluster & Context

```bash
kubectl version --short          # Show client/server version
kubectl cluster-info             # Cluster information
kubectl config get-contexts      # List contexts
kubectl config use-context ctx   # Switch context
kubectl config current-context   # Current context
```

## Nodes

```bash
kubectl get nodes                # List nodes
kubectl describe node <node>     # Node details
kubectl cordon <node>            # Mark node unschedulable
kubectl uncordon <node>          # Mark node schedulable
kubectl drain <node>             # Drain node for maintenance
```

## Namespaces

```bash
kubectl get namespaces           # List namespaces
kubectl create namespace dev     # Create namespace
kubectl delete namespace dev     # Delete namespace
kubectl config set-context --current --namespace=dev
```

## Pods

```bash
kubectl get pods                 # List pods
kubectl get pods -A              # All namespaces
kubectl describe pod <pod>       # Pod details
kubectl logs <pod>               # Pod logs
kubectl logs -f <pod>            # Follow logs
kubectl exec -it <pod> -- bash   # Exec into pod
kubectl delete pod <pod>         # Delete pod
```

## Deployments

```bash
kubectl get deployments          # List deployments
kubectl describe deployment app  # Deployment details
kubectl apply -f deploy.yml      # Create/update deployment
kubectl delete -f deploy.yml     # Delete deployment
kubectl scale deployment app --replicas=3
kubectl rollout status deployment app
kubectl rollout history deployment app
kubectl rollout undo deployment app
```

## Services & Networking

```bash
kubectl get svc                  # List services
kubectl describe svc <svc>       # Service details
kubectl expose deployment app --type=NodePort --port=80
kubectl port-forward pod/<pod> 8080:80
kubectl get endpoints            # Service endpoints
```

## ConfigMaps & Secrets

```bash
kubectl get configmaps           # List ConfigMaps
kubectl create configmap cfg --from-literal=key=value
kubectl describe configmap cfg
kubectl get secrets              # List secrets
kubectl create secret generic sec --from-literal=pwd=123
kubectl describe secret sec
```

## Storage

```bash
kubectl get pv                   # PersistentVolumes
kubectl get pvc                  # PersistentVolumeClaims
kubectl describe pvc <pvc>
```

## Ingress

```bash
kubectl get ingress              # List ingress
kubectl describe ingress <ing>   # Ingress details
```

## Jobs & CronJobs

```bash
kubectl get jobs                 # List jobs
kubectl get cronjobs             # List cronjobs
kubectl describe job <job>
```

## Debugging & Troubleshooting

```bash
kubectl describe pod <pod>       # Inspect pod
kubectl get events               # Cluster events
kubectl logs <pod> -c <container>
kubectl exec -it <pod> -- sh
```

## Resource Management

```bash
kubectl top nodes                # Node resource usage
kubectl top pods                 # Pod resource usage
kubectl get hpa                  # Horizontal Pod Autoscaler
```

## YAML & Output Formats

```bash
kubectl get pod <pod> -o yaml
kubectl get pod <pod> -o wide
kubectl explain pod.spec
```

## Cleanup

```bash
kubectl delete pod --all
kubectl delete all --all -n dev
kubectl delete namespace dev
```

---

*This Kubernetes cheatsheet provides the most commonly used kubectl commands for daily DevOps and cloud-native operations.*
