# 📘 Project Setup & Usage Guide

## 📋 Prerequisites

Make sure the following tools are installed on your system:

* Git
* Docker
* Kubernetes CLI (kubectl)
* Minikube
* Helm
* Jenkins
* Docker Hub account
* Linux environment (Ubuntu recommended)

Verify installations:

```
git --version
docker --version
kubectl version --client
minikube version
helm version
```

---

## 🚀 Step-by-Step Setup

### 1️⃣ Clone the Repository

```
git clone <your-repository-url>
cd simple_Web_app
```

---

### 2️⃣ Start Minikube Cluster

```
minikube start
```

Verify cluster:

```
kubectl get nodes
```

---

### 3️⃣ Build and Push Docker Image

```
docker build -t <dockerhub-username>/simple-web-app .
docker push <dockerhub-username>/simple-web-app
```

---

### 4️⃣ Deploy Application with Helm

```
helm upgrade --install mypyweb ./web-app \
  --set image.repository=<dockerhub-username>/simple-web-app \
  --set image.tag=latest
```

Check deployment:

```
kubectl get pods
kubectl get svc
```

---

### 5️⃣ Access the Application

Using Minikube:

```
minikube service mypyweb
```

Or using port-forward:

```
kubectl port-forward service/mypyweb 8080:80
```

Open browser:

```
http://localhost:8080
```

---

## 🏷️ DevOps Skills Demonstrated

This project showcases practical experience in:

* CI/CD pipeline automation
* Docker containerization
* Kubernetes workload deployment
* Helm chart packaging and upgrades
* Rolling update strategy
* Service exposure and networking
* Troubleshooting Kubernetes deployments
* Git version control workflow

---

## 🔁 Updating the Application

After making code changes:

1. Commit and push changes
2. Jenkins pipeline automatically builds a new image
3. Helm upgrades the Kubernetes deployment
4. Kubernetes performs rolling update

---

## 🧹 Cleanup

To remove the deployment:

```
helm uninstall mypyweb
```

To stop Minikube:

```
minikube stop
```
