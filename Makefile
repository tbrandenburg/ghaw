# GitHub Actions Workflow (GHAW) - Makefile
# A comprehensive Makefile for managing GitHub Actions workflows locally with act

.PHONY: help install-act check-act list-workflows run-all run-push run-manual run-pr clean-docker validate-workflows setup dev-setup test-opencode run-hello opencode-validate opencode-dry-run opencode-setup

# Default target
help: ## Display this help message
	@echo "GitHub Actions Workflow (GHAW) - Available Commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Quick Start:"
	@echo "  make setup              - Initial setup (install act if needed)"
	@echo "  make run-all            - Run all workflows"  
	@echo "  make list               - List available workflows"
	@echo ""
	@echo "OpenCode Integration:"
	@echo "  make test-opencode      - Test simple OpenCode workflow"
	@echo "  make run-hello         - Test simple hello world workflow"

# Installation and Setup
install-act: ## Install act CLI tool (Linux/macOS)
	@echo "Installing act CLI tool..."
	@if command -v curl >/dev/null 2>&1; then \
		curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash; \
	else \
		echo "curl is required to install act. Please install curl first."; \
		exit 1; \
	fi

check-act: ## Check if act is installed and show version
	@if command -v act >/dev/null 2>&1; then \
		echo "✅ act is installed:"; \
		act --version; \
	else \
		echo "❌ act is not installed. Run 'make install-act' to install it."; \
		exit 1; \
	fi

setup: check-act ## Initial project setup
	@echo "🚀 Setting up GHAW project..."
	@echo "✅ act is available"
	@if [ ! -d ".github/workflows" ]; then \
		mkdir -p .github/workflows; \
		echo "✅ Created .github/workflows directory"; \
	fi
	@echo "✅ Setup complete!"

# Workflow Management
list-workflows: check-act ## List all available workflows and jobs
	@echo "📋 Available workflows and jobs:"
	@act -l

list: list-workflows ## Alias for list-workflows

validate-workflows: check-act ## Validate workflow syntax
	@echo "🔍 Validating workflow files..."
	@find .github/workflows -name "*.yml" -o -name "*.yaml" | while read file; do \
		echo "Checking $$file..."; \
		if act -l -W "$$file" >/dev/null 2>&1; then \
			echo "✅ $$file is valid"; \
		else \
			echo "❌ $$file has syntax errors"; \
		fi; \
	done

# Workflow Execution
run-all: check-act ## Run all workflows (default: push event)
	@echo "🚀 Running all workflows with push event..."
	@act push

run-push: check-act ## Run workflows triggered by push event
	@echo "🚀 Running push event workflows..."
	@act push

run-manual: check-act ## Run workflows with manual trigger (workflow_dispatch)
	@echo "🚀 Running manual workflows..."
	@act workflow_dispatch

run-pr: check-act ## Run workflows triggered by pull request
	@echo "🚀 Running pull request workflows..."
	@act pull_request

run-schedule: check-act ## Run scheduled workflows
	@echo "🚀 Running scheduled workflows..."
	@act schedule

# Specific Job Execution
run-hello: check-act ## Run the hello world workflow
	@echo "🚀 Running hello world workflow..."
	@act push -W .github/workflows/simple-hello.yml

run-job: check-act ## Run a specific job (usage: make run-job JOB=job-name)
	@if [ -z "$(JOB)" ]; then \
		echo "❌ Please specify a job name: make run-job JOB=job-name"; \
		echo "Available jobs:"; \
		act -l | tail -n +2 | awk '{print "  - " $$2}'; \
		exit 1; \
	fi
	@echo "🚀 Running job: $(JOB)..."
	@act -j $(JOB)

# Advanced Options
run-offline: check-act ## Run workflows in offline mode (use cached images)
	@echo "🚀 Running workflows in offline mode..."
	@act --action-offline-mode

run-with-secrets: check-act ## Run workflows with secrets file (requires .secrets file)
	@if [ ! -f ".secrets" ]; then \
		echo "❌ .secrets file not found. Create one with your secrets."; \
		echo "Example .secrets file:"; \
		echo "GITHUB_TOKEN=your_token_here"; \
		echo "MY_SECRET=secret_value"; \
		exit 1; \
	fi
	@echo "🚀 Running workflows with secrets..."
	@act --secret-file .secrets

run-with-vars: check-act ## Run workflows with variables file (requires .vars file)
	@if [ ! -f ".vars" ]; then \
		echo "❌ .vars file not found. Create one with your variables."; \
		echo "Example .vars file:"; \
		echo "ENVIRONMENT=development"; \
		echo "VERSION=1.0.0"; \
		exit 1; \
	fi
	@echo "🚀 Running workflows with variables..."
	@act --var-file .vars

# Development and Debugging
debug: check-act ## Run workflows with verbose output
	@echo "🔍 Running workflows in debug mode..."
	@act push --verbose

dry-run: check-act ## Show what would run without executing
	@echo "🔍 Dry run - showing execution plan..."
	@act push --dry-run

inspect-workflow: check-act ## Inspect specific workflow file (usage: make inspect-workflow FILE=filename)
	@if [ -z "$(FILE)" ]; then \
		echo "❌ Please specify a workflow file: make inspect-workflow FILE=hello-world.yml"; \
		ls .github/workflows/; \
		exit 1; \
	fi
	@echo "🔍 Inspecting workflow: $(FILE)"
	@act -l -W .github/workflows/$(FILE)

# Docker and Cleanup
clean-docker: ## Clean up act-related Docker containers and images
	@echo "🧹 Cleaning up Docker containers and images..."
	@docker container prune -f
	@docker image prune -f
	@echo "✅ Cleanup complete"

clean-cache: ## Clean act cache
	@echo "🧹 Cleaning act cache..."
	@rm -rf ~/.cache/act/
	@echo "✅ Cache cleaned"

# File Creation Helpers
create-secrets-template: ## Create a template .secrets file
	@if [ -f ".secrets" ]; then \
		echo "❌ .secrets file already exists"; \
		exit 1; \
	fi
	@echo "# GitHub Actions Secrets" > .secrets
	@echo "# Add your secrets here (one per line)" >> .secrets
	@echo "# GITHUB_TOKEN=your_personal_access_token" >> .secrets
	@echo "# MY_SECRET=secret_value" >> .secrets
	@echo "✅ Created .secrets template file"
	@echo "⚠️  Remember to add .secrets to .gitignore!"

create-vars-template: ## Create a template .vars file
	@if [ -f ".vars" ]; then \
		echo "❌ .vars file already exists"; \
		exit 1; \
	fi
	@echo "# GitHub Actions Variables" > .vars
	@echo "# Add your variables here (one per line)" >> .vars
	@echo "# ENVIRONMENT=development" >> .vars
	@echo "# VERSION=1.0.0" >> .vars
	@echo "# API_URL=https://api.example.com" >> .vars
	@echo "✅ Created .vars template file"

create-actrc: ## Create a .actrc configuration file
	@if [ -f ".actrc" ]; then \
		echo "❌ .actrc file already exists"; \
		exit 1; \
	fi
	@echo "# act configuration file" > .actrc
	@echo "# One argument per line" >> .actrc
	@echo "--action-offline-mode" >> .actrc
	@echo "# --container-architecture=linux/amd64" >> .actrc
	@echo "✅ Created .actrc configuration file"

# Development workflow
dev-setup: setup create-secrets-template create-vars-template ## Full development setup
	@echo "🚀 Complete development setup finished!"
	@echo ""
	@echo "Next steps:"
	@echo "1. Edit .secrets with your actual secrets"
	@echo "2. Edit .vars with your variables"  
	@echo "3. Run 'make run-all' to test workflows"

# Git helpers
git-add-workflows: ## Add workflow files to git
	@git add .github/workflows/
	@echo "✅ Added workflow files to git"

git-status: ## Show git status
	@git status

# Testing and CI
test-workflows: validate-workflows run-all ## Validate and test all workflows
	@echo "✅ All workflow tests passed!"

ci: test-workflows ## Run CI pipeline locally
	@echo "✅ Local CI pipeline completed!"

# Information
info: check-act ## Show project and act information
	@echo "📊 GHAW Project Information:"
	@echo "- Project: GitHub Actions Workflow"
	@echo "- act version: $$(act --version)"
	@echo "- Docker status: $$(docker --version 2>/dev/null || echo 'Not available')"
	@echo "- Workflows directory: .github/workflows/"
	@echo "- Available workflow files:"
	@find .github/workflows -name "*.yml" -o -name "*.yaml" 2>/dev/null | sed 's/^/  - /' || echo "  - None found"

# OpenCode Integration Commands
test-opencode: check-act ## Run simple OpenCode test workflow
	@echo "🚀 Running simple OpenCode test..."
	act workflow_dispatch -W .github/workflows/simple-opencode.yml -P ubuntu-latest=-self-hosted

# OpenCode Development Commands
opencode-validate: ## Validate OpenCode workflow syntax
	@echo "🔍 Validating OpenCode workflow..."
	@if [ -f ".github/workflows/simple-opencode.yml" ]; then \
		act --list -W .github/workflows/simple-opencode.yml >/dev/null 2>&1 && \
		echo "✅ OpenCode workflow syntax is valid" || \
		echo "❌ OpenCode workflow has syntax errors"; \
	else \
		echo "❌ OpenCode workflow file not found"; \
		exit 1; \
	fi

opencode-dry-run: check-act ## Show what would be executed in OpenCode workflow (dry run)
	@echo "🧪 OpenCode workflow dry run..."
	act workflow_dispatch -W .github/workflows/simple-opencode.yml --dry-run

opencode-setup: ## Setup OpenCode integration files
	@echo "🔧 Setting up OpenCode integration..."
	@if [ ! -d ".github/opencode" ]; then \
		mkdir -p .github/opencode; \
		echo "✅ Created .github/opencode directory"; \
	fi
	@if [ ! -f ".github/opencode/config.json" ]; then \
		echo "⚠️  OpenCode config.json not found. Please create it manually."; \
		echo "    Example config available in the repository."; \
	else \
		echo "✅ OpenCode config.json exists"; \
	fi
	@if [ ! -f ".github/workflows/simple-opencode.yml" ]; then \
		echo "⚠️  OpenCode workflow not found. Please create it manually."; \
	else \
		echo "✅ OpenCode workflow exists"; \
	fi