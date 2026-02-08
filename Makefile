# Noethera SDD — Make targets

.PHONY: validate help

validate:
	@./scripts/validate.sh

help:
	@echo "Noethera SDD"
	@echo ""
	@echo "  make validate  — Validate MANIFEST and .agent structure"
	@echo "  make help      — Show this help"
