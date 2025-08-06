#!/bin/bash

# === CONFIGURAÇÕES ===
RESOURCE_GROUP_NAME="tfstate-rg"
STORAGE_ACCOUNT_NAME="tfstatestorage002"  # deve ser único globalmente!
CONTAINER_NAME="tfstate"
LOCATION="eastus"

# === LOGIN NO AZURE (se necessário) ===
echo "🔐 Verificando autenticação no Azure..."
az account show &> /dev/null
if [ $? -ne 0 ]; then
  echo "⚠️  Você não está logado. Realizando login..."
  az login
fi

# === CRIAR RESOURCE GROUP ===
echo "📁 Criando Resource Group: $RESOURCE_GROUP_NAME"
az group create \
  --name $RESOURCE_GROUP_NAME \
  --location $LOCATION

# === CRIAR STORAGE ACCOUNT ===
echo "💾 Criando Storage Account: $STORAGE_ACCOUNT_NAME"
az storage account create \
  --name $STORAGE_ACCOUNT_NAME \
  --resource-group $RESOURCE_GROUP_NAME \
  --location $LOCATION \
  --sku Standard_LRS

# === OBTER CHAVE DE ACESSO ===
ACCOUNT_KEY=$(az storage account keys list \
  --resource-group $RESOURCE_GROUP_NAME \
  --account-name $STORAGE_ACCOUNT_NAME \
  --query "[0].value" -o tsv)

# === CRIAR CONTAINER ===
echo "📦 Criando container: $CONTAINER_NAME"
az storage container create \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT_NAME \
  --account-key $ACCOUNT_KEY

echo "✅ Backend remoto criado com sucesso!"
echo "Você pode agora usar este backend no seu arquivo 'backend.tf' do Terraform."