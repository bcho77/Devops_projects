# 🚀 Simple Web App CI/CD Deployment with Jenkins, Docker, Helm & Kubernetes

## 📌 Project Overview

This project demonstrates a complete **CI/CD pipeline** for deploying a simple Python web application into a Kubernetes cluster (Minikube) using modern DevOps tools.

The application is containerized with Docker, version-controlled with Git, automatically built and deployed using Jenkins, and managed in Kubernetes using Helm.

---

## 🧱 Architecture

Workflow:

1. Developer pushes code to Git repository
2. Jenkins pipeline is triggered
3. Jenkins builds a Docker image
4. Image is pushed to Docker Hub
5. Helm deploys/updates the application on Kubernetes
6. Kubernetes performs rolling update deployment

---

## 🖥️ Application

We created a simple Python web application using Flask that serves a basic webpage.

Example behavior:

* Runs on port **5000**
* Returns a simple HTML response
* Used to demonstrate container deployment workflow

---

## ⚙️ Technologies Used

* Python (Flask)
* Git & GitHub
* Docker
* Jenkins
* Kubernetes (Minikube)
* Helm
* Linux (Ubuntu)

---

## 📂 Project Structure

```
simple_Web_app/
│
├── app/
│   ├── app.py
│   |── requirements.txt
|   └── test_app.py
│
├── Dockerfile
├── Jenkinsfile
├── mypyweb/              # Helm chart
│   ├── templates/
│   ├── values.yaml
│   └── Chart.yaml
│
└── README.md
```

---

## 🐳 Docker Build

Build the Docker image:

```
docker build -t <dockerhub-username>/simple-web-app .
```

Push the image:

```
docker push <dockerhub-username>/simple-web-app
```

---

## ☸️ Kubernetes Deployment with Helm

Install or upgrade the application:

```
helm upgrade --install mypyweb ./web-app \
  --set image.repository=<dockerhub-username>/simple-web-app \
  --set image.tag=latest
```

Check resources:

```
kubectl get pods
kubectl get svc
```

---

## 🌐 Access the Application

Using Minikube:

```
minikube service mypyweb
```

Or port-forward:

```
kubectl port-forward service/mypyweb 8086:80
```

Open in browser:

```
http://localhost:8086
```

---

## 🔁 CI/CD Pipeline (Jenkins)

Pipeline stages:

* Checkout source code
* Build Docker image
* Push image to Docker Hub
* Deploy to Kubernetes using Helm

Example deployment stage:

```
helm upgrade --install mypyweb ./web-app \
  --set image.repository=$IMAGE_NAME \
  --set image.tag=$IMAGE_TAG
```

---

## 🔄 Rolling Updates

Kubernetes ensures zero-downtime deployment by gradually replacing old pods with new ones.

Check rollout status:

```
kubectl rollout status deployment/mypyweb
```

Rollback if needed:

```
kubectl rollout undo deployment/mypyweb
```

---
## 🎯 Learning Objectives

This project was built to practice and demonstrate real-world DevOps concepts:

* Containerizing applications using Docker
* Designing and managing CI/CD pipelines with Jenkins
* Deploying applications to Kubernetes clusters
* Using Helm charts for reusable and configurable deployments
* Understanding rolling updates and Kubernetes service exposure
* Troubleshooting Kubernetes workloads and networking

---

## 🔧 Jenkins CI/CD Pipeline

Jenkins is used to automate the build and deployment process.

When code is pushed to the Git repository, Jenkins performs the following stages:

1. **Checkout Source Code**
   Jenkins pulls the latest code from the Git repository.

2. **Build Docker Image**
   The application image is built using the Dockerfile.

3. **Push Image to Docker Registry**
   The built image is tagged and pushed to Docker Hub.

4. **Deploy to Kubernetes using Helm**
   Jenkins uses Helm to install or upgrade the application release on Minikube.

Example Jenkins deployment stage:

```
stage('Deploy to Kubernetes with Helm') {
    steps {
        sh '''
        helm upgrade --install mypyweb ./web-app \
          --namespace default \
          --set image.repository=$IMAGE_NAME \
          --set image.tag=$IMAGE_TAG
        '''
    }
}
```

This approach ensures that:

* Each new build automatically updates the running application
* Kubernetes performs a rolling update with minimal downtime
* Helm tracks deployment revisions for easy rollback

---

## 📈 Deployment Verification

After pipeline execution, you can verify the deployment using:

```
kubectl get pods
kubectl get svc
kubectl rollout status deployment/mypyweb
```

To view the application in the browser:

```
minikube service mypyweb
```

---

## 🔁 Rollback Strategy

If a new deployment introduces issues, Kubernetes allows quick rollback:

```
kubectl rollout undo deployment/mypyweb
```

Helm also supports rollback:

```
helm rollback mypyweb <revision-number>
```
---