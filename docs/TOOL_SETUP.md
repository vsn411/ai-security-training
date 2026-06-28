# Tool Setup Guide

Step-by-step installation for every tool used in this programme. Follow this before starting Phase 2.

---

## Operating System Notes

| OS | Status | Notes |
|----|--------|-------|
| macOS (Apple Silicon) | ✅ Fully supported | Ollama runs natively on M1/M2/M3 |
| macOS (Intel) | ✅ Fully supported | |
| Ubuntu / Debian Linux | ✅ Fully supported | |
| Windows 11 (WSL2) | ✅ Supported | Run all commands inside WSL2 |
| Windows 11 (native) | ⚠️ Partial | Some tools work; WSL2 recommended |

---

## 1. Ollama

Run LLMs locally. Required from Phase 2 onwards.

```bash
# macOS / Linux
curl -fsSL https://ollama.ai/install.sh | sh

# Windows: download the installer from https://ollama.ai
```

**Verify:**
```bash
ollama --version
ollama serve        # Starts on localhost:11434
```

**Pull models** (do this once; they persist):
```bash
ollama pull gemma2        # 5.5 GB — recommended for most labs
ollama pull llama3.2      # 2.0 GB — faster, use for quick tests
ollama pull mistral       # 4.1 GB — good for reasoning comparisons
```

**Model storage locations:**
- macOS: `~/.ollama/models/`
- Linux: `/usr/share/ollama/.ollama/models/`

---

## 2. Docker

Container isolation for safe experimentation.

**Install:** https://docs.docker.com/get-docker/

```bash
# Verify
docker --version
docker run hello-world
```

---

## 3. Open WebUI

Browser-based chat interface for local models.

```bash
docker run -d \
  -p 3000:8080 \
  --add-host=host.docker.internal:host-gateway \
  -v open-webui:/app/backend/data \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main
```

**Access:** http://localhost:3000  
**Manage:** `docker stop open-webui` / `docker start open-webui`

---

## 4. Python Environment

Python 3.11+ required.

```bash
# Check version
python3 --version

# Install pyenv if you need to manage versions (optional)
curl https://pyenv.run | bash
pyenv install 3.11.9
pyenv global 3.11.9
```

**Always use a virtual environment per project:**
```bash
python3 -m venv venv
source venv/bin/activate     # macOS / Linux
# venv\Scripts\activate      # Windows
```

---

## 5. promptfoo

Prompt testing and evaluation framework.

```bash
# Requires Node.js 18+
node --version

# Install promptfoo
npm install -g promptfoo

# Verify
promptfoo --version
```

**Node.js install (if needed):** https://nodejs.org/en/download

---

## 6. garak

LLM vulnerability scanner.

```bash
pip install garak

# Verify
garak --version

# Quick test against a local model
garak --model_type ollama --model_name gemma2 --probes promptinject
```

---

## 7. Security-Specific Python Libraries

Install these as needed per phase:

```bash
# Phase 3 — Prompt Security
pip install llm-guard

# Phase 4 — RAG Security
pip install chromadb sentence-transformers ragas datasets pypdf
pip install langchain langchain-text-splitters langchain-community

# Phase 5 / Phase 7 — Agent Tools
pip install ollama fastapi uvicorn httpx

# Phase 7 Week 13 — Chainlit
pip install chainlit

# Phase 7 Week 15 — MCP
pip install mcp anthropic
```

---

## 8. Obsidian

Knowledge base for documenting findings.

**Install:** https://obsidian.md

**Recommended vault structure:**
```
AI-Security-Lab/
├── 00-Overview/
├── 01-Foundations/
│   └── threat-models/
├── 02-Local-Lab/
├── 03-Prompt-Security/
│   ├── payloads/
│   └── findings/
├── 04-RAG-Security/
├── 05-Agentic-Workflows/
├── 06-SDLC/
└── Templates/
    ├── finding-template.md
    └── threat-model-template.md
```

---

## 9. LangSmith (Optional — Phase 4+)

LLM observability. Free tier available.

1. Sign up at https://smith.langchain.com
2. Generate an API key
3. Set environment variable:
```bash
export LANGCHAIN_API_KEY="your-key-here"
export LANGCHAIN_TRACING_V2=true
export LANGCHAIN_PROJECT="ai-security-training"
```

---

## Troubleshooting

### Ollama not responding
```bash
# Check if it's running
curl http://localhost:11434/api/tags

# Restart
ollama stop
ollama serve
```

### promptfoo can't reach localhost
```bash
# Ensure Ollama is running
ollama serve

# Test directly
curl http://localhost:11434/api/generate \
  -d '{"model": "gemma2", "prompt": "hello", "stream": false}'
```

### Python package conflicts
```bash
# Always work inside a virtual environment
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### garak failing on Apple Silicon
```bash
# Use Python 3.11 (not 3.12) with garak on M-series Macs
pyenv install 3.11.9
pyenv local 3.11.9
pip install garak
```
