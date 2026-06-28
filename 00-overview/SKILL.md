---
name: ai-security-training-overview
description: "Use this skill as the entry point for any AI security training, learning path navigation, or programme overview. Covers the full 12-week AI Security Learning Plan: what you'll learn, the six development phases, hands-on labs, tools, and outcomes. Trigger when someone asks 'where do I start with AI security', 'what is the AI security curriculum', 'give me the learning roadmap', or 'what tools do I need for AI security training'. This skill routes learners to the correct phase skill and ensures they understand the end-to-end journey before diving in."
---

# AI Security Training — Programme Overview

## Purpose
This free, self-paced programme teaches AI security from first principles to production-grade practice. No paid courses required. Everything runs locally. The only prerequisites are commitment, curiosity, and a desire to learn.

---

## What You Will Learn (6 Core Topics)

| # | Topic | Key Skills |
|---|-------|-----------|
| 1 | AI Application Basics | Architecture, threat surfaces, vocabulary |
| 2 | Prompt Injection & Jailbreaks | Attack techniques, defence patterns |
| 3 | RAG & Vector DB Security | Poisoning, retrieval attacks, grounding |
| 4 | Agent & Tool Security | Tool call risks, permissions, approvals |
| 5 | Evals, Red Teaming & CI Testing | Automated testing, regression suites |
| 6 | Governance, Release Gates & Incident Response | Policy, gates, IR playbooks |

---

## 12-Week Development Roadmap

```
Learn → Build → Test → Operationalise
```

| Phase | Weeks | Focus |
|-------|-------|-------|
| 1 — Foundations | 1–2 | Vocabulary, core risks, threat model template |
| 2 — Local Lab | 2–3 | Safe environment: local models, prompts, RAG |
| 3 — Prompt Security | 3–5 | Jailbreaks, prompt injection, leakage, unsafe outputs |
| 4 — RAG Security | 5–7 | Retrieval poisoning, authorisation, grounding |
| 5 — Agentic Workflows | 7–9 | Tool permissions, approvals, action logging |
| 6 — SDLC Integration | 9–12 | Evals, regression testing, release gates, governance |

→ Each phase has its own SKILL.md with theory + hands-on labs.

---

## Hands-On Labs (Four Core Labs)

| Lab | What You Do |
|-----|-------------|
| **Prompt Injection Lab** | Test direct jailbreaks, prompt leaks, policy bypasses |
| **RAG Poisoning Lab** | Inject malicious documents, measure retrieval behaviour |
| **Agent Misuse Lab** | Evaluate unsafe tool calls, excessive agency, missing approvals |
| **Production-Adjacent Testing** | Synthetic users, isolated data, logging, CI checks |

---

## Your Local AI Lab — Tool Stack

### Core Infrastructure
| Tool | Purpose | Install |
|------|---------|---------|
| **Ollama** | Run LLMs locally (Gemma, Llama, Mistral) | https://ollama.ai |
| **Docker** | Container isolation for safe experimentation | https://docker.com |
| **Open WebUI** | Browser-based chat UI for local models | https://openwebui.com |
| **Obsidian** | Knowledge management / note-taking | https://obsidian.md |

### AI Security-Specific Tools
| Tool | Purpose | Install |
|------|---------|---------|
| **garak** | LLM vulnerability scanner | `pip install garak` |
| **promptfoo** | Prompt testing & eval framework | `npm install -g promptfoo` |
| **LangSmith** | LLM observability & tracing | https://smith.langchain.com |
| **Ragas** | RAG evaluation framework | `pip install ragas` |
| **PyRIT** | Microsoft's red-teaming toolkit | `pip install pyrit` |
| **LLM Guard** | Output scanning / guardrails | `pip install llm-guard` |

### Models to Use
| Model | Via Ollama | Use Case |
|-------|-----------|---------|
| **Gemma 2** | `ollama pull gemma2` | General testing |
| **Llama 3.2** | `ollama pull llama3.2` | Instruction-following tests |
| **Mistral** | `ollama pull mistral` | Prompt injection baseline |

### Reference Frameworks
- **OWASP GenAI Top 10** — https://owasp.org/www-project-top-10-for-large-language-model-applications/
- **NIST AI RMF** — https://airc.nist.gov/RMF/RMF
- **MITRE ATLAS** — https://atlas.mitre.org
- **NCSC Secure AI** — https://www.ncsc.gov.uk/collection/guidelines-secure-ai-system-development
- **ISO/IEC 42001** — AI Management System standard

---

## What You Get Out of It

✅ A working AI security lab (local, free, reproducible)  
✅ A shared vocabulary and threat model  
✅ Reusable red-team test cases  
✅ RAG and agent security checklists  
✅ A first eval / regression test suite  
✅ A backlog of product security improvements  
✅ Release criteria for AI-enabled features  
✅ A repeatable operating model for AI security  

---

## Guiding Principle

> *"Start small: pick one AI use case, threat model it, test it, break it, fix it, and automate the learning."*
> 
> AI security becomes a discipline when learning turns into repeatable practice.

---

## Navigation — Phase Skills

| Phase | Skill File |
|-------|-----------|
| Phase 1 — Foundations | `../01-foundations/SKILL.md` |
| Phase 2 — Local Lab | `../02-local-lab/SKILL.md` |
| Phase 3 — Prompt Security | `../03-prompt-security/SKILL.md` |
| Phase 4 — RAG Security | `../04-rag-security/SKILL.md` |
| Phase 5 — Agentic Workflows | `../05-agentic-workflows/SKILL.md` |
| Phase 6 — SDLC Integration | `../06-sdlc-integration/SKILL.md` |
