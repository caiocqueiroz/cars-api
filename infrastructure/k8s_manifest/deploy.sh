#!/bin/bash

# Define o diretório onde estão seus arquivos de manifesto Kubernetes
MANIFEST_DIR="."

# Define o namespace onde os recursos serão aplicados
NAMESPACE="cars-api"

# Loop através de cada arquivo .yaml no diretório de manifestos e aplique-os com kubectl
for manifest in $MANIFEST_DIR/*.yaml; do
    echo "Aplicando $manifest"
    kubectl apply -f "$manifest" -n $NAMESPACE
done

echo "Todos os manifestos foram aplicados."
