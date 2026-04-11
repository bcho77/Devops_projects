# Helm Cheatsheet (Kubernetes Package Manager)

## Helm Basics

```bash
helm version                   # Show Helm version
helm help                      # Helm help
helm env                       # Helm environment info
```

## Repositories

```bash
helm repo list                 # List repositories
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update               # Update repositories
helm repo remove bitnami       # Remove repository
helm search repo nginx         # Search charts in repos
helm search hub nginx          # Search charts on Artifact Hub
```

## Releases

```bash
helm list                      # List releases in current namespace
helm list -A                   # List releases in all namespaces
helm status my-release         # Release status
helm history my-release        # Release history
helm get all my-release        # Get full release info
helm get values my-release     # Get values
helm get manifest my-release   # Get rendered manifests
```

## Install & Upgrade

```bash
helm install my-release bitnami/nginx
helm install my-release ./chart
helm install my-release bitnami/nginx -n dev --create-namespace
helm upgrade my-release bitnami/nginx
helm upgrade --install my-release bitnami/nginx
helm rollback my-release 1     # Roll back to revision
```

## Uninstall & Cleanup

```bash
helm uninstall my-release
helm uninstall my-release -n dev
helm uninstall my-release --keep-history
```

## Values & Configuration

```bash
helm show values bitnami/nginx
helm install my-release bitnami/nginx -f values.yaml
helm upgrade my-release bitnami/nginx -f values.yaml
helm install my-release bitnami/nginx --set service.type=NodePort
helm install my-release bitnami/nginx --set image.tag=latest
```

## Chart Development

```bash
helm create mychart            # Create new chart
helm lint mychart              # Validate chart
helm template my-release mychart
helm package mychart           # Package chart
helm dependency list           # List dependencies
helm dependency update         # Update dependencies
```

## Namespaces & Context

```bash
helm install my-release bitnami/nginx -n prod
helm list -n prod
helm uninstall my-release -n prod
```

## Debugging & Testing

```bash
helm install my-release bitnami/nginx --dry-run
helm install my-release bitnami/nginx --debug
helm upgrade my-release bitnami/nginx --dry-run --debug
helm test my-release           # Run chart tests
```

## Plugins

```bash
helm plugin list               # List plugins
helm plugin install https://github.com/databus23/helm-diff
helm diff upgrade my-release bitnami/nginx
```

## Common Flags

| Flag      | Meaning                  |
| --------- | ------------------------ |
| -n        | Namespace                |
| -f        | Values file              |
| --set     | Override values          |
| --dry-run | Simulate install/upgrade |
| --debug   | Debug output             |

---

*This Helm cheatsheet covers the most frequently used commands for managing Kubernetes applications using Helm.*
