#!/bin/bash

# Nome da imagem Docker
IMAGE_NAME="beremiz-env"

# Verificar se o Docker está instalado
if ! command -v docker &> /dev/null
then
    echo "Docker não encontrado. Por favor, instale o Docker e tente novamente."
    exit 1
fi

# Construir a imagem Docker
echo "Construindo a imagem Docker..."
docker build -t $IMAGE_NAME .

# Verificar se a construção foi bem-sucedida
if [ $? -eq 0 ]; then
    echo "Imagem Docker construída com sucesso!"
else
    echo "Erro ao construir a imagem Docker."
    exit 1
fi

# Executar o container (opcional)
echo "Executando o container..."
docker run -it $IMAGE_NAME
