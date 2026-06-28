---
name: ai-agent-development-overview
description: "Use this skill as the entry point for the AI Agent Development track (Weeks 13–15). This track teaches learners to BUILD agents from scratch before they test and break them. Covers three tiers: (1) simple Chainlit chat agent with a FastAPI endpoint, (2) agent augmented with RAG using ChromaDB, (3) agent extended with MCP tool servers. Each tier is production-connectable to promptfoo for security testing. Trigger when a learner asks 'how do I build an AI agent', 'where do I start with Chainlit', 'how do I add RAG to my agent', 'what is MCP in agent development', or 'I want to build and then test my own agent'. Routes to the correct sub-skill."
---

# Phase 7 — AI Agent Development (Weeks 13–15)

## Why Build Before You Break

The security phases taught you to attack AI systems. This track teaches you to **build** them — so you understand what you are protecting, why certain defences are hard to implement, and how to design security in from the start rather than bolt it on.

```
Phase 1–6: Attacker mindset  →  Phase 7: Builder mindset  →  Combined: Secure-by-design
```

---

## Three-Week Track at a Glance

| Week | Skill | What You Build | Key Tools |
|------|-------|---------------|-----------|
| 13 | Simple Agent + API | Chainlit chat UI + FastAPI REST endpoint | Chainlit, FastAPI, Ollama |
| 14 | Agent + RAG | Same agent, now answers from a document store | ChromaDB, sentence-transformers |
| 15 | Agent + MCP | Agent with pluggable external tool servers | MCP SDK, tool servers |

All three tiers connect to **promptfoo** for security testing at the end.

---

## Prerequisites

From the local lab (Phase 2), you should already have:
- Ollama running with at least one model pulled
- Python 3.11+ installed
- Docker installed

New installs needed (covered in each skill):
```bash
pip install chainlit fastapi uvicorn
pip install chromadb sentence-transformers langchain
pip install mcp anthropic
```

---

## Architecture Evolution

```
Week 13 — Simple Agent
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Chainlit   │────►│  LLM        │     │  FastAPI    │
│  Chat UI    │     │  (Ollama)   │◄────│  /chat      │
└─────────────┘     └─────────────┘     └─────────────┘

Week 14 — Agent + RAG
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Chainlit   │────►│  LLM        │◄────│  ChromaDB   │
│  Chat UI    │     │  (Ollama)   │     │  Vector DB  │
└─────────────┘     └─────────────┘     └─────────────┘
                           ▲
                    ┌─────────────┐
                    │  FastAPI    │
                    │  /chat /rag │
                    └─────────────┘

Week 15 — Agent + MCP
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Chainlit   │────►│  LLM        │────►│  MCP Tool   │
│  Chat UI    │     │  (Ollama)   │     │  Servers    │
└─────────────┘     └─────────────┘     └─────────────┘
                           ▲                    │
                    ┌─────────────┐      search, files,
                    │  FastAPI    │      APIs, databases
                    │  /chat      │
                    └─────────────┘
```

---

## Security Integration: promptfoo

After each week, you test what you built using promptfoo. This creates the full loop:

```
Build  →  Test Functionality  →  Security Eval  →  Fix  →  Repeat
```

The promptfoo eval suite from Phase 6 connects directly to your FastAPI endpoint — no changes needed, just point `apiBaseUrl` at `http://localhost:8000`.

---

## Navigation

| Sub-Skill | File |
|-----------|------|
| Week 13 — Simple Agent + Chainlit + FastAPI | `./01-simple-agent-chainlit/SKILL.md` |
| Week 14 — Agent + RAG | `./02-agent-with-rag/SKILL.md` |
| Week 15 — Agent + MCP | `./03-agent-with-mcp/SKILL.md` |
