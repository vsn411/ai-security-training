#!/bin/bash
# setup.sh — One-command setup for the RakFort AI Security Training repo
# Usage: bash setup.sh [week13|week14|week15|all]
#
# What this script does:
#   1. Checks prerequisites (Python, Node, Ollama, Docker)
#   2. Installs promptfoo and garak
#   3. Creates a virtual environment for the chosen week
#   4. Installs Python dependencies for that week
#   5. Pulls the default Ollama model

set -e

WEEK=${1:-"all"}
MODEL="gemma2"
BOLD=$(tput bold 2>/dev/null || echo "")
RESET=$(tput sgr0 2>/dev/null || echo "")
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

ok()   { echo -e "${GREEN}  ✅  $1${NC}"; }
warn() { echo -e "${YELLOW}  ⚠️   $1${NC}"; }
fail() { echo -e "${RED}  ❌  $1${NC}"; exit 1; }
info() { echo -e "     $1"; }

echo ""
echo "${BOLD}════════════════════════════════════════════${RESET}"
echo "${BOLD}  RakFort AI Security Training — Setup${RESET}"
echo "${BOLD}════════════════════════════════════════════${RESET}"
echo ""

# ─── Check Prerequisites ────────────────────────────────────────────────────

echo "${BOLD}Checking prerequisites...${RESET}"

# Python
if command -v python3 &>/dev/null; then
  PY_VERSION=$(python3 --version 2>&1 | cut -d' ' -f2)
  ok "Python $PY_VERSION"
else
  fail "Python 3 not found. Install from https://python.org"
fi

# Node.js (for promptfoo)
if command -v node &>/dev/null; then
  NODE_VERSION=$(node --version)
  ok "Node.js $NODE_VERSION"
else
  warn "Node.js not found — promptfoo won't be available"
  info "Install from https://nodejs.org"
fi

# Ollama
if command -v ollama &>/dev/null; then
  ok "Ollama $(ollama --version 2>&1 | head -1)"
else
  warn "Ollama not found. Installing..."
  curl -fsSL https://ollama.ai/install.sh | sh
  ok "Ollama installed"
fi

# Docker
if command -v docker &>/dev/null; then
  ok "Docker $(docker --version | cut -d' ' -f3 | tr -d ',')"
else
  warn "Docker not found — some labs require it"
  info "Install from https://docker.com"
fi

echo ""

# ─── Pull Ollama Model ───────────────────────────────────────────────────────

echo "${BOLD}Setting up Ollama model ($MODEL)...${RESET}"
if ollama list 2>/dev/null | grep -q "$MODEL"; then
  ok "$MODEL already available"
else
  info "Pulling $MODEL (this may take several minutes)..."
  ollama pull "$MODEL"
  ok "$MODEL ready"
fi

echo ""

# ─── Install promptfoo ───────────────────────────────────────────────────────

if command -v node &>/dev/null; then
  echo "${BOLD}Installing promptfoo...${RESET}"
  if command -v promptfoo &>/dev/null; then
    ok "promptfoo $(promptfoo --version 2>&1) already installed"
  else
    npm install -g promptfoo
    ok "promptfoo installed"
  fi
  echo ""
fi

# ─── Install garak ───────────────────────────────────────────────────────────

echo "${BOLD}Installing garak...${RESET}"
if python3 -c "import garak" 2>/dev/null; then
  ok "garak already installed"
else
  pip install garak --quiet
  ok "garak installed"
fi

echo ""

# ─── Setup Week Projects ────────────────────────────────────────────────────

setup_week() {
  local WEEK_DIR="$1"
  echo "${BOLD}Setting up $WEEK_DIR...${RESET}"

  if [ ! -d "$WEEK_DIR" ]; then
    warn "Directory $WEEK_DIR not found — skipping"
    return
  fi

  cd "$WEEK_DIR"

  # Create venv
  python3 -m venv venv
  source venv/bin/activate

  # Install deps
  if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt --quiet
    ok "Python dependencies installed"
  fi

  # Make start.sh executable
  chmod +x start.sh 2>/dev/null || true
  ok "start.sh ready"

  deactivate
  cd ..

  echo ""
}

case "$WEEK" in
  week13) setup_week "week13-simple-agent" ;;
  week14) setup_week "week13-simple-agent"; setup_week "week14-rag-agent" ;;
  week15) setup_week "week13-simple-agent"; setup_week "week14-rag-agent"; setup_week "week15-mcp-agent" ;;
  all)
    setup_week "week13-simple-agent"
    setup_week "week14-rag-agent"
    setup_week "week15-mcp-agent"
    ;;
  *)
    warn "Unknown option '$WEEK'. Use: week13 | week14 | week15 | all"
    ;;
esac

# ─── Done ────────────────────────────────────────────────────────────────────

echo "${BOLD}════════════════════════════════════════════${RESET}"
echo "${BOLD}  Setup complete!${RESET}"
echo "${BOLD}════════════════════════════════════════════${RESET}"
echo ""
echo "  Start learning:   open 00-overview/SKILL.md"
echo ""
echo "  Start Week 13:    cd week13-simple-agent && bash start.sh"
echo "  Start Week 14:    cd week14-rag-agent    && bash start.sh"
echo "  Start Week 15:    cd week15-mcp-agent    && bash start.sh"
echo ""
echo "  Run evals:        cd weekXX-* && promptfoo eval -c tests/promptfoo-eval.yaml"
echo ""
