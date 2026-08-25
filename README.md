<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=32&duration=3000&pause=1000&color=2EC4B6&center=true&vCenter=true&width=650&lines=Full-Stack+To-Do+Application;Flutter+%2B+Node.js+%2B+DynamoDB;Dockerized+%7C+Kubernetes+%7C+Terraform;CI%2FCD+Automated+with+Jenkins" alt="Typing SVG" />

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

**A cloud-native, production-style To-Do application** — Flutter frontend, Express/Node.js REST API,
DynamoDB persistence, containerized with Docker, orchestrated with Kubernetes, provisioned with
Terraform, and shipped through an automated Jenkins CI/CD pipeline.

</div>

<br/>

<p align="center">
  <img src="https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.png" width="100%">
</p>

## 📖 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Tech Stack](#️-tech-stack)
- [System Architecture](#-system-architecture)
- [CI/CD Pipeline (Jenkins)](#-cicd-pipeline-jenkins)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Environment Variables](#-environment-variables)
- [Database Schema](#-database-schema)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [License](#-license)
- [Author](#-author)

<br/>

## ✨ Overview

This project is a **complete task-management platform** built to demonstrate a real end-to-end
software delivery lifecycle — not just an app, but the infrastructure and automation around it.

Users can register, log in, and manage personal to-do items through a Flutter client (Web, Android,
iOS, Desktop) backed by a stateless Express REST API. Authentication is handled with JWT, passwords
are hashed with bcrypt, and all data is persisted in Amazon DynamoDB. The entire stack is
containerized, deployed to Kubernetes, provisioned with Terraform, and automated end-to-end with
a Jenkins pipeline.

<br/>

## 🚀 Features

| | |
|---|---|
| 🔐 **Secure Authentication** | JWT-based sessions with bcrypt password hashing |
| ✅ **Full CRUD** | Create, list, and delete personal to-do items |
| 📱 **Cross-Platform Client** | One Flutter codebase → Web, Android, iOS, Windows, macOS, Linux |
| 🗄️ **NoSQL Persistence** | Amazon DynamoDB with on-demand billing |
| 🐳 **Containerized** | Independent Docker images for frontend & backend |
| ☸️ **Orchestrated** | Kubernetes Deployments + Services for both tiers |
| 🌍 **Infrastructure as Code** | Terraform-managed AWS resources (DynamoDB, S3, ECR) |
| 🔁 **Automated CI/CD** | Jenkins pipeline: build → test → containerize → provision → deploy |

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

**Database & Cloud**

| Tool | Purpose |
|---|---|
| ![DynamoDB](https://img.shields.io/badge/-DynamoDB-4053D6?style=flat-square&logo=amazondynamodb&logoColor=white) | Primary NoSQL data store |
| ![S3](https://img.shields.io/badge/-Amazon%20S3-569A31?style=flat-square&logo=amazons3&logoColor=white) | Object storage / Terraform assets |
| ![ECR](https://img.shields.io/badge/-Amazon%20ECR-FF9900?style=flat-square&logo=amazonaws&logoColor=white) | Container image registry |
| ![LocalStack](https://img.shields.io/badge/-LocalStack-181A29?style=flat-square) | Local AWS emulation for dev |

**DevOps & Infrastructure**

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

> A visual representation of the end-to-end flow — from a developer's `git push` to a live request in production.

```mermaid
flowchart TB
    classDef ci fill:#FFF3E0,stroke:#FF9F1C,color:#7A4A00,stroke-width:1px
    classDef client fill:#EDE7F6,stroke:#7B42BC,color:#3C1A66,stroke-width:1px
    classDef k8s fill:#E3F2FD,stroke:#326CE5,color:#0D3B78,stroke-width:1px
    classDef aws fill:#FFF8E1,stroke:#FF9900,color:#7A4E00,stroke-width:1px

    Dev([👩‍💻 Developer git push]) --> GH[(GitHub Repository)]

    subgraph CI["🔁 Jenkins CI/CD Pipeline"]
        direction LR
        J1[Checkout SCM] --> J2[Install deps and run tests]
        J2 --> J3[Build Docker images]
        J3 --> J4[Push images to ECR]
        J4 --> J5[Terraform apply]
        J5 --> J6[kubectl apply to K8s]
    end
    class CI ci

    GH -->|Webhook trigger| J1

    subgraph AWS["☁️ AWS Resources — via Terraform / LocalStack"]
        direction LR
        ECR[(Amazon ECR<br/>image registry)]
        S3[(Amazon S3<br/>bucket)]
        DDB[(Amazon DynamoDB<br/>TodoUsers / TodoItems)]
    end
    class AWS aws

    J4 --> ECR
    J5 --> S3
    J5 --> DDB

    subgraph K8S["☸️ Kubernetes Cluster — Minikube"]
        direction LR
        FE[Frontend Pod<br/>Nginx + Flutter web build]
        BE[Backend Pod<br/>Express REST API :4588]
    end
    class K8S k8s

    J6 --> FE
    J6 --> BE
    ECR -.pulls image.-> FE
    ECR -.pulls image.-> BE

    User([📱 End user]) -->|HTTPS| FE
    FE -->|REST / JSON| BE
    BE -->|JWT auth + CRUD via AWS SDK| DDB

    class Dev,User client
