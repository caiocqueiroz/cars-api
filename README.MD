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

