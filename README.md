# Cloud DevOps Capstone Project

## About Project:

> Creates a CI/CD pipeline for a basic website that deploys to a cluster in AWS EKS with a Blue/Green deployment strategy.

## Project Requirement:

> To be able to use this CI/CD pipeline you will need to install:

- Jenkins
- Blue Ocean Plugin in Jenkins
- Pipeline-AWS Plugin in Jenkins
- Docker
- Pip
- AWS Cli
- Eksctl
- Kubectl

## Folder Description:

> InfrastructurePipeline : Contains jenkinsfile for cluster deployment on EKS

> ServicePipeline : Contains jenkinsfile, dockerfile and src code for deploying a basic website to EKS cluster with a blue/green strategy
