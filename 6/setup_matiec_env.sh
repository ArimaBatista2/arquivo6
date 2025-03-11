#!/bin/bash

# Configura as variáveis de ambiente para o MATIEC
export MATIEC_INCLUDE_PATH=/home/arima/Beremiz/matiec/lib
export MATIEC_C_INCLUDE_PATH=/home/arima/Beremiz/matiec/lib/C
export PATH=/home/arima/Beremiz/matiec:$PATH

# Exibe as variáveis configuradas
echo "MATIEC_INCLUDE_PATH set to: $MATIEC_INCLUDE_PATH"
echo "MATIEC_C_INCLUDE_PATH set to: $MATIEC_C_INCLUDE_PATH"
echo "PATH updated to include: /home/user/matiec"

# Mensagem final
echo "Environment for MATIEC configured successfully!"
