---
name: repo-check
description: Comprehensive pre-push repository review to identify issues, inconsistencies, and improvements
argument-hint: "Optional: specify review scope (e.g., security, docs, config, dependencies)"
agent: agent
tools:
  ['search', 'read/readFile', 'execute/runInTerminal', 'execute/getTerminalOutput']
---

## User Input

```text
${input:scope:Optional review scope — e.g. security, docs, config}
```

Consider user input for scope focus (if provided). Otherwise, perform a full review.

## Goal

Perform a comprehensive pre-push review of this repository to identify potential issues, inconsistencies, and improvements.

## Review Checklist

### 1. Configuration Integrity
- Check all configuration files for broken references (missing files, directories, or assets)
- Verify repository URLs and names in configuration files match the actual repository
- Validate CI/CD workflows reference existing actions, scripts, and dependencies
- Ensure all tools and dependencies referenced in configs are available or documented

### 2. Security & Secrets
- Scan for hardcoded credentials, API keys, tokens, or passwords
- Verify `.gitignore` properly excludes sensitive files
- Check that example configurations use placeholders, not real values
- Ensure no `.env` files or secret files are staged for commit

### 3. Repository Hygiene
- Identify build artifacts, cache files, or temporary files that shouldn't be committed
- Find large binary files (>1MB) and assess if they need optimization or Git LFS
- Check for empty directories that serve no purpose
- Verify no OS-specific files (.DS_Store, Thumbs.db) are included

### 4. Documentation Alignment
- Compare documented folder structure with actual repository structure
- Ensure README accurately describes the repository's purpose and contents
- Verify instructions and guidance match the repository type (e.g., docs-only vs application)
- Check that getting-started instructions are accurate and complete

### 5. Dependency Management
- Verify all package files (package.json, pyproject.toml, requirements.txt) are present and consistent
- Check that lockfiles exist where expected
- Ensure pre-commit hooks reference available tools
- Validate CI dependency installation matches local development setup

### 6. File Quality
- Check for unnecessarily large images and suggest optimization
- Verify asset files referenced in documentation exist
- Ensure file naming conventions are consistent
- Check that licenses are appropriate and present if needed

## Output Format

For each issue found, provide:
- **Severity**: Critical / Important / Recommendation
- **Category**: Configuration / Security / Hygiene / Documentation / Dependencies / Quality
- **Issue**: Clear description of the problem
- **Impact**: Why this matters
- **Solution Options**: 2-3 approaches to fix, with a recommendation

Group findings by severity, then present them one at a time for review and fixing.

## Approach

1. Run automated checks first (file scans, grep patterns, tree structure)
2. Analyze configuration files systematically
3. Compare documentation against reality
4. Provide actionable, specific recommendations
5. Offer to fix issues one by one with user approval