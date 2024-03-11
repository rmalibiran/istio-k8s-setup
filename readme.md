# Istio Setup in Kubernetes

This is a version of the `kubernetes-manifests.yaml` that will work on Apple Silicon / arm64 machines.

## Resources
- Video Tutorial: https://www.youtube.com/watch?v=voAyroDb6xk&list=PLy7NrYWoggjyvPa2FNiLoxqH73rndE4La&index=2
- [Google's Microservice Demo arm64 fork by woop](https://github.com/woop/microservices-demo)
- [Official Google's Microservice Demo](https://github.com/GoogleCloudPlatform/microservices-demo)

## Pre-requisites
- IAM user that have access to ECR where the built docker images are uploaded
- Properly setup AWS key and secret (part of the `awscli` setup) configuration on your dev machine

## Backbround
- Intended users: **arm64** or **Apple Silicon (M1, M2, etc)** development machines
- [Google's Microservice Demo arm64 fork by woop](https://github.com/woop/microservices-demo) was built on an Apple Silicon machine, the resulting docker images is then uploaded to AWS ECR - a private repository.

## How to:
When following Techworld with Nana's Video Tutorial, use the `kubernetes-manifests.yaml` file included in this repo instead of the one from Official Google's Microservice Demo.

1. Fill-up the config variables of `ecr-login.sh`
    ```
    AWS_ECR_ACCOUNT=<YOUR AWS ACCOUNT ID>
    EMAIL=<YOUR AWS IAM EMAIL>
    ```
2. run `./ecr-login.sh`
3. Techworld with Nana's Video Tutorial

## TODO
- `loadgenerator` arm64 build 
  - we'll use this to properly see the microservices' relationship to each other (via Kiali) 
  - Workaround: just port forward the `svc/frontend` to your machine to test the deployment. The `loadgenerator` is just a quality-of-life enchancement to simulate ongoing usage of the services.