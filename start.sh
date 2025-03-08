#!/bin/bash

# 🎨 Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

BACKEND_DIR="./BackEnd"
FRONTEND_DIR="./Frontend"

echo -e "${YELLOW}🔄 Stopping old running instances...${NC}"
pkill -f "node|npm|pnpm|yarn|vite|react-scripts" 2>/dev/null

start_backend() {
    echo -e "${GREEN}🚀 Starting Backend...${NC}"
    cd "$BACKEND_DIR" || exit
    npm install
    npm start &  
    cd - > /dev/null
}

start_frontend() {
    echo -e "${GREEN}🚀 Starting Frontend...${NC}"
    cd "$FRONTEND_DIR" || exit
    npm install
    npm run dev &  # ✅ Yeh ab exposed frontend run karega
    cd - > /dev/null
}

cleanup() {
    echo -e "${RED}🛑 Stopping Servers...${NC}"
    pkill -f "node|npm|pnpm|yarn|vite|react-scripts" 2>/dev/null
    exit 1
}

trap cleanup SIGINT

start_backend
start_frontend

echo -e "${GREEN}🎉 Servers are running! Press Ctrl+C to stop.${NC}"

wait
