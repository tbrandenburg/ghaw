# GitHub Actions Workflow (GHAW) - Simplified Makefile
# Essential commands for managing GitHub Actions workflows locally with act

.PHONY: help setup list run-all run-hello run-opencode test-opencode test-security test-safety validate clean

# Default target
help: ## Display available commands
	@echo "GHAW - GitHub Actions Workflow Testing"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Quick Start:"
	@echo "  make setup        - Install act and setup project"
	@echo "  make list         - List available workflows" 
	@echo "  make run-all      - Run all workflows"

# Setup and Installation
setup: ## Install act and setup project
	@echo "🚀 Setting up GHAW project..."
	@if ! command -v act >/dev/null 2>&1; then \
		echo "Installing act CLI..."; \
		curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash; \
	fi
	@echo "✅ act is available: $$(act --version)"
	@if [ ! -d ".github/workflows" ]; then \
		mkdir -p .github/workflows; \
		echo "✅ Created .github/workflows directory"; \
	fi
	@echo "✅ Setup complete!"

# Core Workflow Commands  
list: ## List available workflows and jobs
	@echo "📋 Available workflows:"
	@act -l

validate: ## Validate workflow syntax
	@echo "🔍 Validating workflows..."
	@find .github/workflows -name "*.yml" -o -name "*.yaml" | while read file; do \
		if act -l -W "$$file" >/dev/null 2>&1; then \
			echo "✅ $$(basename $$file)"; \
		else \
			echo "❌ $$(basename $$file) - syntax error"; \
		fi; \
	done

run-all: ## Run all workflows
	@echo "🚀 Running all workflows..."
	@act push

run-hello: ## Run hello world workflow
	@echo "🚀 Running hello world..."
	@act push -W .github/workflows/examples/simple-hello.yml

run-opencode-simple: ## Run OpenCode workflow
	@echo "🚀 Running OpenCode workflow..."
	@act workflow_dispatch -W .github/workflows/examples/simple-opencode.yml -P ubuntu-latest=catthehacker/ubuntu:act-latest

run-opencode-enhanced: ## Run enhanced OpenCode workflow with security and safety reviews
	@echo "🚀 Running enhanced OpenCode workflow..."
	@act workflow_dispatch -W .github/workflows/examples/enhanced-opencode.yml -P ubuntu-latest=catthehacker/ubuntu:act-latest

# Cleanup
clean: ## Clean Docker containers and act cache
	@echo "🧹 Cleaning up..."
	@docker container prune -f >/dev/null 2>&1 || true
	@docker image prune -f >/dev/null 2>&1 || true
	@rm -rf ~/.cache/act/ 2>/dev/null || true
	@echo "✅ Cleanup complete"