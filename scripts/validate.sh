#!/usr/bin/env bash
# Validate Noethera SDD manifest and structure.
# Run from repo root: ./scripts/validate.sh

set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AGENT="$ROOT/.agent"
MANIFEST="$AGENT/MANIFEST.yaml"
ERR=0

echo "→ Validating Noethera SDD structure..."

# MANIFEST exists
[ -f "$MANIFEST" ] || { echo "✗ MANIFEST.yaml not found"; ERR=1; }

# Workflow
[ -f "$AGENT/workflows/sdd-workflow.md" ] || { echo "✗ workflows/sdd-workflow.md missing"; ERR=1; }
[ -f "$AGENT/workflows/phases/spec.md" ] || { echo "✗ workflows/phases/spec.md missing"; ERR=1; }
[ -f "$AGENT/workflows/phases/design.md" ] || { echo "✗ workflows/phases/design.md missing"; ERR=1; }
[ -f "$AGENT/workflows/phases/verify.md" ] || { echo "✗ workflows/phases/verify.md missing"; ERR=1; }

# Rules (always_on + model_decision)
for r in rugged-software-constitution security-mandate core-design-principles architecture-and-patterns api-and-maintainability reliability-and-errors logging-and-observability-mandate code-completion-mandate code-organization-principles documentation-principles concurrency-and-threading-mandate avoid-circular-dependencies code-idioms-and-conventions sdd-workflow; do
  [ -f "$AGENT/rules/${r}.md" ] || { echo "✗ rules/${r}.md missing"; ERR=1; }
done
for r in security-principles testing-strategy logging-and-observability-principles dependency-management-principles resources-and-memory-management-principles concurrency-and-threading-principles project-structure data-serialization-principles performance-optimization-principles command-execution-principles configuration-management-principles; do
  [ -f "$AGENT/rules/${r}.md" ] || { echo "✗ rules/${r}.md missing"; ERR=1; }
done

# Skills
for s in debugging-protocol frontend-design sequential-thinking code-review-checklist; do
  [ -f "$AGENT/skills/${s}/SKILL.md" ] || { echo "✗ skills/${s}/SKILL.md missing"; ERR=1; }
done

# Tasks template
[ -f "$AGENT/tasks/_template.yaml" ] || { echo "✗ tasks/_template.yaml missing"; ERR=1; }

# Specs template
[ -f "$AGENT/specs/_template.yaml" ] || { echo "✗ specs/_template.yaml missing"; ERR=1; }

# Project dirs
[ -d "$AGENT/project/rules" ] || { echo "✗ project/rules/ missing"; ERR=1; }
[ -d "$AGENT/project/skills" ] || { echo "✗ project/skills/ missing"; ERR=1; }

if [ $ERR -eq 0 ]; then
  echo "✓ All paths valid"
else
  echo "✗ Validation failed ($ERR error(s))"
  exit 1
fi
