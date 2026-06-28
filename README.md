# 🛡️ AI Security Training

**A free, self-paced, hands-on curriculum for AI security and agent development.**  
Everything runs locally. No paid tools, no cloud accounts, no subscriptions required.

> *"Start small: pick one AI use case, threat model it, test it, break it, fix it, and automate the learning."*

---

## Who This Is For

- Fresh graduates and interns entering AI security
- AppSec / product security engineers adding AI to their scope
- Developers who build AI features and want to understand the risks
- Security professionals upskilling into GenAI

**Prerequisites:** Basic Python, comfort with a terminal. No prior AI security knowledge needed.

---

## Programme Structure

```
📚 Phase 1–6  →  Security Track (12 weeks)   Attack & defend AI systems
🔧 Phase 7    →  Developer Track (3 weeks)    Build agents from scratch
🔗 Connected  →  promptfoo ties both tracks together
```

### Security Track — 12 Weeks

| Phase | Folder | Weeks | Topic |
|-------|--------|-------|-------|
| 0 | `00-overview/` | — | Programme overview & tool stack |
| 1 | `01-foundations/` | 1–2 | AI threat modelling, OWASP LLM Top 10 |
| 2 | `02-local-lab/` | 2–3 | Local lab setup: Ollama, Docker, Open WebUI |
| 3 | `03-prompt-security/` | 3–5 | Prompt injection, jailbreaks, garak |
| 4 | `04-rag-security/` | 5–7 | RAG poisoning, retrieval attacks, Ragas |
| 5 | `05-agentic-workflows/` | 7–9 | Excessive agency, tool call abuse |
| 6 | `06-sdlc-integration/` | 9–12 | CI/CD evals, release gates, governance |

### Developer Track — 3 Weeks

| Week | Folder | Topic |
|------|--------|-------|
| 13 | `week13-simple-agent/` | Chainlit chat UI + FastAPI REST endpoint |
| 14 | `week14-rag-agent/` | Agent + ChromaDB RAG + document upload |
| 15 | `week15-mcp-agent/` | Agent + MCP tool servers + agentic loop |

---

## Quick Start

### 1. Clone the repo
```bash
git clone https://github.com/rakfort/ai-security-training.git
cd ai-security-training
```

### 2. Install core tools
```bash
# Ollama — run LLMs locally
curl -fsSL https://ollama.ai/install.sh | sh
ollama pull gemma2

# promptfoo — prompt testing framework
npm install -g promptfoo

# garak — LLM vulnerability scanner
pip install garak
```

### 3. Start learning
Open [`00-overview/SKILL.md`](00-overview/SKILL.md) and follow the navigation.

---

## Repository Layout

```
rakfort-ai-security-training/
│
├── README.md                          ← You are here
├── CONTRIBUTING.md                    ← How to add content / report issues
├── LICENSE                            ← MIT
│
├── docs/
│   ├── TOOL_SETUP.md                  ← Detailed tool installation guide
│   ├── OBSIDIAN_VAULT_GUIDE.md        ← How to set up your knowledge base
│   └── FRAMEWORKS.md                  ← OWASP, MITRE ATLAS, NIST links
│
├── .github/
│   ├── workflows/
│   │   └── ai-security-eval.yml       ← CI/CD eval pipeline (Phase 6)
│   └── ISSUE_TEMPLATE/
│       ├── bug_report.md
│       └── new_skill.md
│
├── 00-overview/SKILL.md               ← Start here
├── 01-foundations/SKILL.md
├── 02-local-lab/SKILL.md
├── 03-prompt-security/SKILL.md
├── 04-rag-security/SKILL.md
├── 05-agentic-workflows/SKILL.md
├── 06-sdlc-integration/SKILL.md
│
├── 07-agent-development/
│   ├── SKILL.md                       ← Track overview
│   ├── 01-simple-agent-chainlit/SKILL.md
│   ├── 02-agent-with-rag/SKILL.md
│   └── 03-agent-with-mcp/SKILL.md
│
├── week13-simple-agent/               ← Runnable project code
│   ├── config.py
│   ├── agent_core.py
│   ├── chainlit_app.py
│   ├── api.py
│   ├── requirements.txt
│   ├── start.sh
│   └── tests/
│       └── promptfoo-eval.yaml
│
├── week14-rag-agent/                  ← Runnable project code
│   ├── config.py
│   ├── agent_core.py
│   ├── rag_engine.py
│   ├── chainlit_app.py
│   ├── api.py
│   ├── ingest.py
│   ├── requirements.txt
│   ├── start.sh
│   ├── sample_docs/
│   │   ├── product_faq.md
│   │   └── company_policy.md
│   └── tests/
│       └── promptfoo-rag-eval.yaml
│
└── week15-mcp-agent/                  ← Runnable project code
    ├── config.py
    ├── agent_core.py
    ├── mcp_client.py
    ├── rag_engine.py
    ├── chainlit_app.py
    ├── api.py
    ├── requirements.txt
    ├── start.sh
    ├── agent_sandbox/
    │   └── .gitkeep
    ├── mcp_servers/
    │   ├── filesystem_server.py
    │   └── custom_api_server.py
    └── tests/
        └── promptfoo-mcp-eval.yaml
```

---

## The Learning Loop

```
SKILL.md (theory + exercises)
        ↓
Run the code in week1X-*/ folders
        ↓
Test with promptfoo eval suite
        ↓
Document findings in Obsidian
        ↓
Fix → add regression test → repeat
```

Each SKILL.md is self-contained: theory, hands-on labs, completion checklist, and a link to the next phase.

---

## Tool Stack (All Free)

| Tool | Purpose | Link |
|------|---------|------|
| **Ollama** | Run LLMs locally | https://ollama.ai |
| **Chainlit** | Chat UI framework | https://chainlit.io |
| **FastAPI** | REST API framework | https://fastapi.tiangolo.com |
| **ChromaDB** | Local vector database | https://trychroma.com |
| **promptfoo** | Prompt testing & evals | https://promptfoo.dev |
| **garak** | LLM vulnerability scanner | https://github.com/leondz/garak |
| **LLM Guard** | Output guardrails | https://llm-guard.com |
| **Ragas** | RAG evaluation | https://docs.ragas.io |
| **MCP SDK** | Tool server protocol | https://modelcontextprotocol.io |
| **Docker** | Container isolation | https://docker.com |
| **Obsidian** | Knowledge base | https://obsidian.md |

---

## Reference Frameworks

| Framework | What It Covers | URL |
|-----------|---------------|-----|
| OWASP LLM Top 10 | AI-specific vulnerability taxonomy | https://owasp.org/www-project-top-10-for-large-language-model-applications/ |
| MITRE ATLAS | AI attack techniques matrix | https://atlas.mitre.org |
| NIST AI RMF | AI risk management lifecycle | https://airc.nist.gov/RMF/RMF |
| NCSC Secure AI | Secure AI development guidelines | https://www.ncsc.gov.uk/collection/guidelines-secure-ai-system-development |
| ISO/IEC 42001 | AI management system standard | (via ISO) |
| EU AI Act | Regulatory compliance | https://artificialintelligenceact.eu |

---

## Built by RakFort

[RakFort](https://rakfort.com) is a Dublin-based AI security company.  
Products: GuardFort · ModelFort · ScanFort · RiskFort

Issues, improvements, and pull requests welcome — see [CONTRIBUTING.md](CONTRIBUTING.md).
