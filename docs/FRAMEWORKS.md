# Reference Frameworks

Quick-reference guide to the security and governance frameworks used throughout this programme.

---

## OWASP LLM Top 10 (2025)

The primary vulnerability taxonomy for LLM-based applications.

| ID | Risk | Phase Covered |
|----|------|--------------|
| LLM01 | Prompt Injection | Phase 3 |
| LLM02 | Insecure Output Handling | Phase 3, 5 |
| LLM03 | Training Data Poisoning | Phase 1 |
| LLM04 | Model Denial of Service | Phase 1 |
| LLM05 | Supply Chain Vulnerabilities | Phase 1, 6 |
| LLM06 | Sensitive Information Disclosure | Phase 3, 4 |
| LLM07 | Insecure Plugin Design | Phase 5 |
| LLM08 | Excessive Agency | Phase 5 |
| LLM09 | Overreliance | Phase 4, 6 |
| LLM10 | Model Theft | Phase 1 |

**URL:** https://owasp.org/www-project-top-10-for-large-language-model-applications/

---

## MITRE ATLAS

Adversarial Threat Landscape for AI Systems — a tactics and techniques matrix for AI attacks, modelled after ATT&CK.

**Key tactics relevant to this programme:**
- AML.TA0001 — Reconnaissance
- AML.TA0002 — Resource Development
- AML.TA0004 — Initial Access (including prompt injection)
- AML.TA0007 — Exfiltration
- AML.TA0009 — Impact

**URL:** https://atlas.mitre.org

---

## NIST AI RMF

The AI Risk Management Framework. Four functions:

| Function | What It Means | Programme Mapping |
|---------|--------------|------------------|
| **GOVERN** | Set AI risk policy and accountability | Phase 6 governance artefacts |
| **MAP** | Understand AI context and risks | Phase 1 threat modelling |
| **MEASURE** | Test and evaluate AI risks | Phases 3–5 labs, Phase 6 evals |
| **MANAGE** | Treat and monitor risks | Phase 6 release gates, CI/CD |

**URL:** https://airc.nist.gov/RMF/RMF

---

## NCSC Guidelines for Secure AI

UK National Cyber Security Centre guidelines jointly published with international partners. Covers:
- Secure design for AI systems
- Secure development
- Secure deployment
- Secure operation and maintenance

**URL:** https://www.ncsc.gov.uk/collection/guidelines-secure-ai-system-development

---

## ISO/IEC 42001

International standard for AI Management Systems. Key control domains:
- 6.1 — Actions to address risks and opportunities
- 8.4 — AI system impact assessment
- 9.1 — Monitoring, measurement, analysis and evaluation

Relevant for organisations pursuing formal AI governance maturity. Aligns with the governance artefacts in Phase 6.

---

## EU AI Act

Regulatory framework with risk-based classification:

| Risk Level | Examples | Requirements |
|-----------|---------|-------------|
| **Unacceptable** | Social scoring, real-time biometric surveillance | Prohibited |
| **High** | Recruitment AI, credit scoring, critical infrastructure | Conformity assessment, registration |
| **Limited** | Chatbots, deepfakes | Transparency obligations |
| **Minimal** | Spam filters, AI in games | No specific obligations |

Most AI assistants and security tools covered in this programme fall in the **Limited** or **Minimal** category.

**URL:** https://artificialintelligenceact.eu

---

## Model Context Protocol (MCP)

Open standard for agent-tool communication (Week 15).

- Defines how AI agents discover and call external tools
- JSON-RPC 2.0 based
- Supports stdio and HTTP/SSE transport

**URL:** https://modelcontextprotocol.io  
**Server registry:** https://modelcontextprotocol.io/servers
