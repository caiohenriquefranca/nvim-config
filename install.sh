#!/bin/bash

REPO_URL="https://github.com/caiohenriquefranca/nvim-config.git"
CONFIG_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim_backup_$(date +%Y%m%d_%H%M%S)"

echo "Iniciando a instalação da configuração do Neovim (Caio's config)..."

# --- 1. Verificar Pré-requisitos ---
if ! command -v nvim &> /dev/null
then
    echo "Erro: Neovim não está instalado ou não está no PATH."
    echo "Por favor, instale o Neovim primeiro (ex: sudo apt install neovim) e tente novamente."
    exit 1
fi

if ! command -v git &> /dev/null
then
    echo "Erro: Git não está instalado."
    echo "Por favor, instale o Git primeiro (ex: sudo apt install git) e tente novamente."
    exit 1
fi

echo "Pré-requisitos (Neovim e Git) verificados."

# --- 2. Fazer Backup da Configuração Existente ---
if [ -d "$CONFIG_DIR" ]; then
    echo "Detectada configuração existente do Neovim em $CONFIG_DIR."
    echo "Fazendo backup para $BACKUP_DIR..."
    mv "$CONFIG_DIR" "$BACKUP_DIR"
    echo "Backup concluído."
fi

# --- 3. Clonar o Novo Repositório ---
echo "Clonando o repositório $REPO_URL para $CONFIG_DIR..."
if git clone --depth 1 "$REPO_URL" "$CONFIG_DIR"; then
    echo "Clonagem concluída com sucesso!"
else
    echo "Erro: Falha ao clonar o repositório."
    echo "Tentando restaurar o backup, se existir..."
    if [ -d "$BACKUP_DIR" ]; then
        mv "$BACKUP_DIR" "$CONFIG_DIR"
    fi
    exit 1
fi

# --- 4. Instruções Finais ---
echo "Instalação base concluída."
echo "---------------------------------------------------------"
echo "PRÓXIMOS PASSOS OBRIGATÓRIOS:"
echo "1. Abra o Neovim:"
echo "   nvim"
echo "2. Dentro do Neovim, instale os plugins digitando:"
echo "   :PlugInstall"
echo "3. Aguarde a instalação dos plugins terminar, feche e reabra o Neovim."
echo "4. Execute ':Mason' e instale os servidores de linguagem (pyright, ts_ls, rust_analyzer, gopls)."
echo "---------------------------------------------------------"

# Abre o Neovim para o usuário iniciar a instalação dos plugins
nvim

