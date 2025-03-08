#!/bin/bash

# 🎨 Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 📌 Define backend and frontend paths (Update as needed)
BACKEND_DIR="./BackEnd"
FRONTEND_DIR="./Frontend"

# 🛑 Stop any running instances
echo -e "${YELLOW}🔄 Stopping old running instances...${NC}"
pkill -f "node|npm|pnpm|yarn|vite|react-scripts" 2>/dev/null

# ✅ Function to start backend
start_backend() {
    echo -e "${GREEN}🚀 Starting Backend...${NC}"
    cd "$BACKEND_DIR" || exit
    npm install  # Ensure dependencies are installed
    npm start &  # Run backend in background
    cd - > /dev/null
}

# ✅ Function to start frontend
start_frontend() {
    echo -e "${GREEN}🚀 Starting Frontend...${NC}"
    cd "$FRONTEND_DIR" || exit
    npm install  # Ensure dependencies are installed
    npm run dev &  # Run frontend in background
    cd - > /dev/null
}

# ✅ Function to handle Ctrl+C (Stop processes)
cleanup() {
    echo -e "${RED}🛑 Stopping Servers...${NC}"
    pkill -f "node|npm|pnpm|yarn|vite|react-scripts" 2>/dev/null
    exit 1
}

# ⏳ Run backend and frontend
trap cleanup SIGINT  # Catch Ctrl+C to stop processes
start_backend
start_frontend

# ✅ Show success message
echo -e "${GREEN}🎉 Servers are running! Press Ctrl+C to stop.${NC}"

# 🛑 Keep script alive
wait
