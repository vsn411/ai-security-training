# Contributing to RakFort AI Security Training

Thank you for helping improve this curriculum. Contributions from practitioners make it more accurate and current.

## Ways to Contribute

- **Fix errors** — typos, broken commands, outdated tool versions
- **Add labs** — new hands-on exercises for existing phases
- **Add findings** — real-world attack patterns discovered during testing
- **Add skill files** — new phases or tool-specific deep dives
- **Translate** — help make this accessible in other languages

## Contribution Rules

1. **All labs must run locally** — no paid APIs, no cloud accounts required
2. **Test before submitting** — run the exercise yourself; paste real output
3. **Security-safe** — attack exercises target local models only; never real services
4. **Cite sources** — link to CVEs, papers, or blog posts that inspired exercises

## How to Submit

1. Fork the repository
2. Create a branch: `git checkout -b add-phase3-new-lab`
3. Make your changes
4. Run the relevant promptfoo eval to confirm nothing is broken
5. Open a Pull Request with a description of what you changed and why

## Reporting Issues

Use GitHub Issues with the appropriate template:
- 🐛 `bug_report.md` — broken command, wrong output, stale dependency
- 💡 `new_skill.md` — suggest a new phase, lab, or tool

## Code Style

- Python: follow PEP 8, use type hints, add docstrings to public functions
- Markdown: use ATX headings (`##`), fenced code blocks with language tags
- SKILL.md files: follow the existing format (frontmatter → objectives → theory → labs → checklist → next link)
