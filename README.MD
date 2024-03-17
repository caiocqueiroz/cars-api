# Projeto: Implantação de API no AKS com Terraform e Helm

## Descrição
implantação segura e escalável de uma API e seu banco de dados no Azure Kubernetes Service (AKS) utilizando Terraform (IaC) e Helm para a configuração e gerenciamento dos recursos no cluster.

## User Storys

### Epic
**Implantação Segura e Escalável de uma API com Banco de Dados no Azure Kubernetes Service (AKS) usando Terraform e Helm**

Como engenheiro de DevOps, preciso implantar uma API escalável com banco de dados usando o AKS. Preciso garantir a comunicação segura entre os componentes e acessibilidade externa apenas para a API.
### Features e User Stories

#### Feature 1: Infraestrutura como Código com Terraform
- **US1.1**: Criar e gerenciar a infraestrutura do AKS usando Terraform.

#### Feature 2: Configuração e Gerenciamento com Helm
- **US2.1**: Definir, instalar e gerenciar a API e o banco de dados usando Helm charts.

#### Feature 3: Imagens de Containers com Dockerfiles
- **US3.1**: Criar Dockerfiles otimizados e seguros para a API e o banco de dados.

#### Feature 4: Segurança e Acessibilidade
- **US4.1**: Garantir acessibilidade externa para a API e acessibilidade interna para o banco de dados.

#### Feature 5: CI/CD e GitOps (Opcionais)
- **US5.1**: Implementar um sistema CI/CD para automação da implantação.
- **US5.2**: Explorar GitOps para gerenciamento de configuração e implantação.

#### Feature 6: Monitoramento, Log Management e Alertas (Opcionais)
- **US6.1**: Implementar práticas de monitoramento, gestão de logs e alertas.

## Repository Folder structure

- application : here you will find all the application (api) files.
- infraestructure : here you will find all the terraform files, kubernetes yaml manifests and helm files
  - into infrastructure you will find the folders k8_smanifest (k8s yamls manifests) and cars-api-hel (helm files)

## Thought process 

- I've created a reallly simple API application using node called cars-api, it is just hold some cars with brand, model and color. i've created CRUD endpoints on this API.
- I've did some local testes using DockerFiles in order to test the application and also the containers communication and functioning. if you want to test it locally you can simple run "docker compose up --build"
- After everything is running locally i've started to build the terraform infrastructure. i've create a principal in Azure so terraform can manage the resources. I've create a resource group to hold cars-api resources and a k8s cluster in AKS, cluster have 2 nodes with auto scaling enable, it is using kubenet profile, i considered not needed to have a more complex network config to address what the exercise requested, but if i would go this route i would configure Azure CNI with VPC + public and private subnets and a natgateway.  
- I've also created a ACR for this setupe and used the principal of AKS to allow it to access ACR.
- I've created some yaml manifest to test in the cluster the deployments, after everything worked i've created the templates and values in helm chart and installed it in the cluster to test.
