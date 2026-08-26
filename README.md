<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=32&duration=3000&pause=1000&color=2EC4B6&center=true&vCenter=true&width=700&lines=Full-Stack+To-Do+Application;Flutter+%2B+Node.js+%2B+DynamoDB;Dockerized+%7C+Kubernetes+%7C+Terraform;CI%2FCD+Automated+with+Jenkins" alt="Typing SVG" />

<br/>

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Node.js](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org)
[![Express](https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com)
[![DynamoDB](https://img.shields.io/badge/DynamoDB-4053D6?style=for-the-badge&logo=amazondynamodb&logoColor=white)](https://aws.amazon.com/dynamodb/)
[![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonaws&logoColor=white)](https://aws.amazon.com)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io)
[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io)
[![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white)](https://www.jenkins.io)
[![JWT](https://img.shields.io/badge/JWT-000000?style=for-the-badge&logo=jsonwebtokens&logoColor=white)](https://jwt.io)

![GitHub repo size](https://img.shields.io/github/repo-size/saurabhisane/To-Do-app?style=flat-square&color=2EC4B6)
![GitHub last commit](https://img.shields.io/github/last-commit/saurabhisane/To-Do-app?style=flat-square&color=FF9F1C)
![GitHub stars](https://img.shields.io/github/stars/saurabhisane/To-Do-app?style=flat-square&color=E71D36)
![GitHub forks](https://img.shields.io/github/forks/saurabhisane/To-Do-app?style=flat-square&color=011627)
![License](https://img.shields.io/badge/License-MIT-informational?style=flat-square&color=2EC4B6)

### A cloud-native, production-style To-Do application

**Flutter frontend · Express REST API · DynamoDB · Docker · Kubernetes · Terraform · Jenkins CI/CD**

<p align="center">
  <a href="#-overview"><b>Overview</b></a> ·
  <a href="#-features"><b>Features</b></a> ·
  <a href="#️-tech-stack"><b>Tech Stack</b></a> ·
  <a href="#-system-architecture"><b>Architecture</b></a> ·
  <a href="#-cicd-pipeline-jenkins"><b>CI/CD</b></a> ·
  <a href="#-getting-started"><b>Getting Started</b></a>
</p>

</div>

<br/>

<p align="center">
  <img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">
</p>

<br/>

## ✨ Overview

This project is a **complete task-management platform** built to demonstrate a real end-to-end
software delivery lifecycle — not just an app, but the infrastructure and automation around it.

Users register, log in, and manage personal to-do items through a Flutter client (Web, Android,
iOS, Desktop) backed by a stateless Express REST API. Authentication runs on JWT, passwords are
hashed with bcrypt, and everything is persisted in Amazon DynamoDB. The stack is containerized,
deployed to Kubernetes, provisioned with Terraform, and shipped end-to-end through a Jenkins
pipeline.

<br/>

## 🚀 Features

<table>
<tr>
<td width="50%" valign="top">

🔐 **Secure authentication**
JWT-based sessions with bcrypt password hashing

✅ **Full CRUD**
Create, list, and delete personal to-do items

📱 **Cross-platform client**
One Flutter codebase → Web, Android, iOS, Windows, macOS, Linux

</td>
<td width="50%" valign="top">

🗄️ **NoSQL persistence**
Amazon DynamoDB with on-demand billing

🐳 **Containerized & orchestrated**
Independent Docker images, deployed via Kubernetes

🔁 **Automated CI/CD**
Jenkins: build → test → containerize → provision → deploy

</td>
</tr>
</table>

<br/>

## 🛠️ Tech Stack

<table>
<tr>
<td valign="top" width="50%">

**Frontend**

| Tool | Purpose |
|---|---|
| ![Flutter](https://img.shields.io/badge/-Flutter-02569B?style=flat-square&logo=flutter&logoColor=white) | Cross-platform UI framework |
| ![Dart](https://img.shields.io/badge/-Dart-0175C2?style=flat-square&logo=dart&logoColor=white) | Application language |
| ![Nginx](https://img.shields.io/badge/-Nginx-009639?style=flat-square&logo=nginx&logoColor=white) | Serves the compiled web build |

**Backend**

| Tool | Purpose |
|---|---|
| ![Node.js](https://img.shields.io/badge/-Node.js-339933?style=flat-square&logo=nodedotjs&logoColor=white) | JavaScript runtime |
| ![Express](https://img.shields.io/badge/-Express-000000?style=flat-square&logo=express&logoColor=white) | REST API framework |
| ![JWT](https://img.shields.io/badge/-JWT-000000?style=flat-square&logo=jsonwebtokens&logoColor=white) | Stateless authentication |
| ![bcrypt](https://img.shields.io/badge/-bcrypt-8A2BE2?style=flat-square) | Password hashing |

</td>
<td valign="top" width="50%">

**Database & cloud**

| Tool | Purpose |
|---|---|
| ![DynamoDB](https://img.shields.io/badge/-DynamoDB-4053D6?style=flat-square&logo=amazondynamodb&logoColor=white) | Primary NoSQL data store |
| ![S3](https://img.shields.io/badge/-Amazon%20S3-569A31?style=flat-square&logo=amazons3&logoColor=white) | Object storage / Terraform assets |
| ![ECR](https://img.shields.io/badge/-Amazon%20ECR-FF9900?style=flat-square&logo=amazonaws&logoColor=white) | Container image registry |
| ![LocalStack](https://img.shields.io/badge/-LocalStack-181A29?style=flat-square) | Local AWS emulation for dev |

**DevOps & infrastructure**

| Tool | Purpose |
|---|---|
| ![Docker](https://img.shields.io/badge/-Docker-2496ED?style=flat-square&logo=docker&logoColor=white) | Containerization |
| ![Kubernetes](https://img.shields.io/badge/-Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white) | Container orchestration |
| ![Terraform](https://img.shields.io/badge/-Terraform-7B42BC?style=flat-square&logo=terraform&logoColor=white) | Infrastructure as Code |
| ![Jenkins](https://img.shields.io/badge/-Jenkins-D24939?style=flat-square&logo=jenkins&logoColor=white) | CI/CD automation |

</td>
</tr>
</table>

<br/>

## 🏗️ System Architecture

> One diagram, end to end — from a developer's `git push` all the way to a served request in
> production. Grouped like an AWS reference diagram: pipeline on top, cloud runtime below.

```mermaid
flowchart TB
    classDef ci fill:#FFF3E0,stroke:#FF9F1C,color:#7A4A00,stroke-width:1px
    classDef client fill:#EDE7F6,stroke:#7B42BC,color:#3C1A66,stroke-width:1px
    classDef k8s fill:#E3F2FD,stroke:#326CE5,color:#0D3B78,stroke-width:1px
    classDef aws fill:#FFF8E1,stroke:#FF9900,color:#7A4E00,stroke-width:1px
    classDef step fill:#2EC4B6,stroke:#0F6E56,color:#04342C,stroke-width:1px

    Dev(["👩‍💻 Developer<br/>git push"]) --> GH[("① GitHub Repository")]

    subgraph CI["🔁 Jenkins CI/CD Pipeline"]
        direction LR
        J1["② Checkout & Test"] --> J2["③ Build Docker Images"]
        J2 --> J3["④ Push Images to ECR"]
    end
    class CI ci

    GH -->|Webhook trigger| J1

    subgraph AWS_ENV["☁️ AWS Cloud — via Terraform"]
        direction LR
        ECR[("Amazon ECR")]
        TF["⑤ terraform apply"]
        DDB[("DynamoDB")]
        S3[("S3 Bucket")]
        TF --> DDB
        TF --> S3
    end
    class AWS_ENV aws

    J3 --> ECR
    J3 -.-> TF

    subgraph K8S["☸️ Kubernetes Cluster"]
        direction LR
        FE["Frontend Pod<br/>Nginx + Flutter"]
        BE["Backend Pod<br/>Express API :4588"]
    end
    class K8S k8s

    TF -->|"⑥ kubectl apply"| K8S
    ECR -.pulls image.-> FE
    ECR -.pulls image.-> BE
    BE -->|JWT auth + CRUD| DDB

    User(["📱 End user"]) -->|"⑦ HTTPS"| FE
    FE -->|REST / JSON| BE

    class Dev,User client
```

<br/>

## 🔁 CI/CD Pipeline (Jenkins)

The Jenkins pipeline is what turns a `git push` into a running Pod. Each stage maps to a
`Jenkinsfile` stage block:

| Stage | What happens | Key tools |
|---|---|---|
| 1️⃣ **Checkout** | Jenkins pulls the latest commit from GitHub via webhook trigger | `Jenkins`, `Git` |
| 2️⃣ **Install & Test** | Backend deps installed (`npm ci`), Flutter deps fetched (`flutter pub get`), lint/tests run | `npm`, `Flutter CLI` |
| 3️⃣ **Build images** | Backend and frontend Docker images built from their respective `Dockerfile`s | `Docker` |
| 4️⃣ **Push to registry** | Tagged images pushed to Amazon ECR | `Docker`, `AWS ECR` |
| 5️⃣ **Provision infra** | `terraform apply` ensures DynamoDB tables, S3 bucket, and ECR repo are up to date | `Terraform` |
| 6️⃣ **Deploy** | `kubectl apply -f infrastructure/k8s/` rolls out the new images to the cluster | `kubectl`, `Kubernetes` |
| 7️⃣ **Verify** | Rollout status + health checks confirm the new Pods are ready | `kubectl rollout status` |

<br/>

## 📂 Project Structure

```text
To-Do-app/
├── backend/                     # Express REST API
│   ├── config/
│   │   └── dynamodb.js          # DynamoDB client configuration
│   ├── controller/
│   │   ├── user.controller.js   # Register / login handlers
│   │   └── todo.controller.js   # CRUD handlers
│   ├── routers/
│   │   ├── user.route.js
│   │   └── todo.route.js
│   ├── services/
│   │   ├── user.services.js     # bcrypt + JWT logic
│   │   └── todo.services.js     # DynamoDB operations
│   ├── app.js                   # Express app + middleware
│   ├── index.js                 # Server entrypoint (port 4588)
│   ├── Dockerfile
│   └── package.json
│
├── to_do_app/                   # Flutter client
│   ├── lib/
│   │   ├── screens/              # login, signup, home, todo screens
│   │   ├── config.dart           # API base URL + endpoints
│   │   └── main.dart
│   ├── Dockerfile                # Multi-stage build -> Nginx
│   └── pubspec.yaml
│
├── infrastructure/
│   ├── terraform/                # IaC: DynamoDB, S3, ECR
│   │   ├── dynamodb.tf
│   │   ├── ecr.tf
│   │   ├── s3.tf
│   │   ├── provider.tf
│   │   └── variables.tf
│   └── k8s/                      # Kubernetes manifests
│       ├── backend-deployment.yaml
│       ├── backend-config.yaml
│       ├── backend-secret.yaml
│       ├── todo-backend-service.yaml
│       ├── frontend-deployment.yaml
│       └── todo-frontend-service.yaml
│
├── Jenkinsfile                   # CI/CD pipeline definition
└── README.md
```

<br/>

## ⚙️ Getting Started

### Prerequisites

![Node](https://img.shields.io/badge/Node.js-%E2%89%A518-339933?style=flat-square&logo=nodedotjs&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%E2%89%A53.x-02569B?style=flat-square&logo=flutter&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-required-2496ED?style=flat-square&logo=docker&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-%E2%89%A51.5-7B42BC?style=flat-square&logo=terraform&logoColor=white)
![kubectl](https://img.shields.io/badge/kubectl-required-326CE5?style=flat-square&logo=kubernetes&logoColor=white)

<table>
<tr><td width="28px" align="center"><b>1</b></td><td>

**Clone the repository**
```bash
git clone https://github.com/saurabhisane/To-Do-app.git
cd To-Do-app
```

</td></tr>
<tr><td align="center"><b>2</b></td><td>

**Run the backend locally**
```bash
cd backend
npm install
npm run dev          # nodemon, watches for changes
# Server runs on http://localhost:4588
```

</td></tr>
<tr><td align="center"><b>3</b></td><td>

**Run the Flutter client**
```bash
cd to_do_app
flutter pub get
flutter run -d chrome --dart-define=API_BASE_URL=http://localhost:4588/
```

</td></tr>
<tr><td align="center"><b>4</b></td><td>

**Spin up infrastructure locally (LocalStack + Terraform)**
```bash
cd infrastructure/terraform
terraform init
terraform apply -auto-approve
```

</td></tr>
<tr><td align="center"><b>5</b></td><td>

**Build & deploy with Docker + Kubernetes**
```bash
docker build -t todo-app:latest ./backend
docker build -t todo-frontend:latest ./to_do_app
kubectl apply -f infrastructure/k8s/
```

</td></tr>
<tr><td align="center"><b>6</b></td><td>

**Automate it all with Jenkins**
Point a Jenkins multibranch pipeline job at this repository — the included `Jenkinsfile`
handles build, test, image push, Terraform provisioning, and Kubernetes rollout automatically
on every push.

</td></tr>
</table>

<br/>

## 🔐 Environment Variables

| Variable | Description | Default |
|---|---|---|
| `AWS_REGION` | AWS region for DynamoDB client | `us-east-1` |
| `DYNAMODB_ENDPOINT` | DynamoDB endpoint (LocalStack or real AWS) | `http://localhost:4566` |
| `AWS_ACCESS_KEY_ID` | AWS access key | `test` |
| `AWS_SECRET_ACCESS_KEY` | AWS secret key | `test` |
| `JWT_SECRET` | Secret used to sign JWTs | `SecretKey` |
| `API_BASE_URL` | Base API URL consumed by the Flutter client | `http://192.168.49.2:32300/` |

> ⚠️ Replace the default dev credentials and JWT secret with real secrets (e.g. via Kubernetes
> `Secret` objects or a secrets manager) before deploying beyond local development.

<br/>

<p align="center">
  <img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">
</p>

<div align="center">

Built by **[Saurabh Isane](https://github.com/saurabhisane)**

⭐ **If this project helped you, consider giving it a star!** ⭐

</div>
