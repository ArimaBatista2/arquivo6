# Dockerfile

# Usar a imagem base do Ubuntu Server
FROM ubuntu:22.04

# Definir variáveis de ambiente para evitar prompts durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar o sistema e instalar pacotes necessários
RUN apt-get update && apt-get install -y \
    build-essential \
    make \
    python3 \
    python3-pip \
    git \
    flex \
    bison \
    python3-venv \
    autotools-dev \  
    automake \       
    libtool \
    python3-wxgtk4.0 \ 
    build-essential libgtk-3-dev \
    libwxgtk3.0-gtk3-dev libwxbase3.0-dev \
    libglu1-mesa libnotify-dev \
    freeglut3 freeglut3-dev \
    libsm-dev libgtk2.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer1.0-dev \
    xfce4 \
    xfce4-goodies \
    xorg \
    dbus-x11 \
    x11-xserver-utils \
    && rm -rf /var/lib/apt/lists/*

# Criar diretório Beremiz e clonar repositórios
RUN mkdir root/Beremiz && cd root/Beremiz && \
    git clone https://github.com/beremiz/beremiz.git && \
    git clone https://github.com/beremiz/matiec.git && \
    git clone https://github.com/beremiz/Modbus.git && \
    git clone https://github.com/beremiz/erpc.git && \
    git clone https://github.com/ArimaBatista2/arquivo6.git

# Compilar matiec
RUN cd root//Beremiz/matiec && \
    autoreconf -fvi && \
    ./configure && \
    make 

# Criar e ativar ambiente virtual Python
RUN cd root//Beremiz && \
    python3 -m venv venv && \
    . venv/bin/activate && \
    pip install numpy matplotlib lxml zeroconf cryptography wxPython

# Definir o diretório de trabalho
WORKDIR root/Beremiz

# Comando padrão ao iniciar o container
CMD ["bash"]
