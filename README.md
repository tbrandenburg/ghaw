# GHAW - GitHub Actions Workflow

**GitHub Actions Workflow** - A comprehensive toolkit for GitHub repository automation, workflow management, and AI-powered code reviews.

## 📋 Table of Contents

- [Overview](#overview)
- [🔧 Makefiles](#makefiles)
- [🚀 Quick Start](#quick-start)
- [📄 Available Workflows](#available-workflows)
- [🛠 Installation & Setup](#installation--setup)
- [📊 Project Setup](#project-setup)
- [⭐ Features](#features)
- [📁 Repository Structure](#repository-structure)
- [🤝 Contributing](#contributing)

## 🎯 Overview

GHAW provides multiple specialized Makefiles for different GitHub repository management tasks:

- **🔄 Workflow Testing** (`Makefile`) - Test GitHub Actions locally with `act`
- **🤖 Auto-Routine** (`Makefile.ghar`) - Install automated stale PR/issue management
- **🏷️ Project Labels** (`Makefile.ghprj`) - Setup OSLC-aligned workflow labels  
- **👥 Team Generation** (`Makefile.team`) - Generate OpenCode agents from team XML

## 🔧 Makefiles

### [`Makefile`](Makefile) - GitHub Actions Workflow Testing
Test workflows locally using `act` before deploying to GitHub Actions.

```bash
# One-liner setup and validation (from any directory)
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile | make -f - setup
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile | make -f - validate

# Local usage (in cloned repository)
make setup                    # Install act and setup project
make list                     # List available workflows
make run-all                  # Run all workflows locally
make run-hello                # Run hello world example
make run-opencode-simple      # Run basic OpenCode workflow
make run-opencode-enhanced    # Run enhanced OpenCode with reviews
make validate                 # Validate workflow syntax
make clean                    # Clean Docker containers and cache
```

### [`Makefile.ghar`](Makefile.ghar) - GitHub Auto-Routine Installer 🤖
Install automated daily routine that checks for stale PRs and issues.

```bash
# One-liner installation
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - install

# Or clone and install
make -f Makefile.ghar install    # Install complete system
make -f Makefile.ghar validate   # Validate setup  
make -f Makefile.ghar info       # Show configuration
make -f Makefile.ghar clean      # Remove installed files
```

**What it installs:**
- `ghar-daily-routine.yml` - Daily workflow (9:00 AM UTC)
- `opencode-run.yml` - OpenCode runner workflow
- `ghar-stale-check.md` - Stale check command definition
- `opencode.jsonc` - OpenCode configuration (if missing)

### [`Makefile.ghprj`](Makefile.ghprj) - GitHub Project Label Setup 🏷️
Setup OSLC-aligned workflow task state labels with proper colors and descriptions.

```bash
# One-liner installation (from any directory)
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghprj | make -f - setup
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghprj | make -f - setup-dry-run

# Local usage (in cloned repository) 
make -f Makefile.ghprj setup                    # Setup all label types
make -f Makefile.ghprj setup INTERACTIVE=true   # Interactive setup
make -f Makefile.ghprj setup-dry-run           # Preview changes
make -f Makefile.ghprj setup-list              # List current labels
```

**Label Systems Supported:**
- **Workflow**: open, ready, in-progress, reviewed, closed, released
- **Priority**: high, medium, low (urgency-based)  
- **Severity**: critical, high, medium, low (impact-based)
- **Confidence**: high, medium, low (certainty-based)
- **Complexity**: high, medium, low (effort-based)
- **Rank**: 1-10 (ordering-based)

### [`Makefile.team`](Makefile.team) - OpenCode Team Agent Generator 👥
Generate OpenCode agent definitions and commands from team XML files.

```bash
# One-liner generation (from any directory with teams/ folder)
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.team | make -f - gen-opencode
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.team | make -f - gen-opencode TEAM_FILE=teams/custom.xml

# Local usage (in cloned repository)
make -f Makefile.team gen-opencode                           # Use default team
make -f Makefile.team gen-opencode TEAM_FILE=teams/other.xml # Use specific team
make -f Makefile.team clean-agents                          # Remove generated agents
make -f Makefile.team clean-commands                        # Remove generated commands  
make -f Makefile.team clean                                 # Clean all generated files
```

## 🚀 Quick Start

### Option 1: Install GHAR Auto-Routine (Recommended for any repository)
```bash
# Add automated stale checking to your repository
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - install
git add .github .opencode && git commit -m "Add GHAR auto-routine"
```

### Option 2: Clone and Test Workflows Locally
```bash
git clone https://github.com/tbrandenburg/ghaw.git
cd ghaw
make setup                    # Install act CLI
make list                     # See available workflows
make run-all                  # Test all workflows locally
```

### Option 3: Setup Project Labels
```bash
# One-liner label setup (requires gh CLI authentication)  
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghprj | make -f - setup

# Interactive setup with custom prefixes
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghprj | make -f - setup INTERACTIVE=true
```

## 📄 Available Workflows

### Examples Category
- **`examples-simple-hello.yml`** - Basic "Hello World" demonstration  
- **`examples-simple-opencode.yml`** - Basic OpenCode installation and test
- **`examples-enhanced-opencode.yml`** - Enhanced OpenCode with security/safety reviews
- **`examples-comprehensive-review.yml`** - Multi-stage comprehensive reviews
- **`examples-simple-opencode-review-agent.yml`** - Simple review agent demo

### Core Workflows  
- **`opencode-run.yml`** - Reusable OpenCode runner workflow (used by other workflows)
- **`ghar-daily-routine.yml`** - Daily automated stale PR/issue checking

### Issue Management
- **`issues-issue-command-executor.yml`** - Execute commands from issue comments
- **`issues-issue-commands-list.yml`** - List available issue commands

### Automation (Disabled)
- **`automation-*.yml.disabled`** - Various automation workflows (currently disabled)

## 🛠 Installation & Setup

### Prerequisites
- **Docker** - Required for `act` to run workflows locally  
- **Git** - Version control
- **GitHub CLI (`gh`)** - Required for label setup and GHAR installation
- **make** - Command execution (pre-installed on Linux/macOS)
- **jq** - JSON processing (for label setup)
- **python3** - URL encoding (for label setup)

### Install Dependencies

**GitHub CLI:**
```bash
# Install gh CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg

# Authenticate  
gh auth login
```

**Docker:**
```bash
# Ubuntu/Debian
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER  # Add to docker group

# macOS - Install Docker Desktop
# Windows - Install Docker Desktop
```

## 📊 Project Setup

### 1. Setup GitHub Repository Labels
```bash
# Setup complete OSLC-aligned label system
make -f Makefile.ghprj setup

# Interactive setup (choose prefixes)
make -f Makefile.ghprj setup INTERACTIVE=true

# Dry run (preview changes)
make -f Makefile.ghprj setup-dry-run
```

### 2. Install Auto-Routine System
```bash
# Install automated stale checking
make -f Makefile.ghar install

# Commit the changes
git add .github .opencode && git commit -m "Add GHAR auto-routine"
```

### 3. Generate Team Agents (if using team XML)
```bash
# Generate from default team
make -f Makefile.team gen-opencode

# Generate from specific team file
make -f Makefile.team gen-opencode TEAM_FILE=teams/custom-team.xml
```

## ⭐ Features

### 🤖 Automated Stale Management (GHAR)
- **Daily checks** for stale PRs (>3 days) and issues (>3 days)
- **Smart filtering** - ignores drafts, WIP, long-term labels
- **Polite notifications** - mentions repository owner
- **One-shot comments** - won't spam the same item twice
- **Easy installation** - one-liner setup for any repository

### 🏷️ OSLC-Aligned Label System  
- **Workflow states**: open → ready → in-progress → reviewed → closed → released
- **Metadata labels**: priority, severity, confidence, complexity, rank
- **Consistent colors** - red (urgent/complex) to green (simple/safe)
- **Custom namespaces** - support for prefixed labels (e.g., `priority/`, `p/`)

### 👥 Team Agent Generation
- **XML-driven** - define teams in structured XML format
- **Auto-generation** - creates OpenCode agents and command definitions
- **Role-based** - different agent types (developer, reviewer, etc.)
- **Customizable** - team-specific instructions and capabilities

### 🧪 Local Workflow Testing
- **Act integration** - test GitHub Actions workflows locally
- **Docker-based** - consistent environment matching GitHub Actions
- **Multiple runners** - support for different runner images
- **Validation** - syntax checking before deployment
## 📁 Repository Structure

```
ghaw/
├── .github/
│   └── workflows/                    # GitHub Actions workflows
│       ├── examples-*.yml           # Example/demo workflows  
│       ├── opencode-run.yml         # Reusable OpenCode runner
│       ├── ghar-daily-routine.yml     # Daily automation
│       └── issues-*.yml             # Issue management workflows
├── .opencode/                       # OpenCode configuration
│   ├── agents/                      # Generated agent definitions
│   ├── commands/                    # OpenCode command definitions  
│   └── opencode.jsonc               # OpenCode configuration
├── teams/                           # Team XML definitions
│   ├── dynamous.xml                 # Dynamous team configuration
│   └── sw-dev-team.xml             # Software development team
├── Makefile                         # Workflow testing (act integration)
├── Makefile.ghar                    # GitHub Auto-Routine installer  
├── Makefile.ghprj                   # Project label setup
├── Makefile.team                    # Team agent generation
├── README.md                        # This documentation
└── LICENSE                          # MIT License
```

## 🔍 Usage Examples

### Test Workflows Locally
```bash
# Setup and run all workflows
make setup && make run-all

# Run specific workflow type
make run-hello                    # Simple demo
make run-opencode-simple         # Basic OpenCode test
make run-opencode-enhanced       # Full OpenCode with reviews

# Advanced act usage
act push -W .github/workflows/examples-simple-hello.yml
act workflow_dispatch --env CUSTOM_VAR=value
```

### Setup Repository Automation
```bash
# Install complete automation system (one-liner)
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - install

# Setup GitHub labels for project management (one-liner)
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghprj | make -f - setup

# Generate OpenCode agents from team definitions (one-liner - requires teams/ folder)
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.team | make -f - gen-opencode

# Local usage (in cloned repository)
make -f Makefile.ghar install
make -f Makefile.ghprj setup  
make -f Makefile.team gen-opencode TEAM_FILE=teams/sw-dev-team.xml
```

### Customization Examples
```bash
# Custom GHAR source repository (one-liner)
curl -fsSL https://raw.githubusercontent.com/your-org/ghaw/main/Makefile.ghar | make -f - install SOURCE_REPO=your-org/ghaw

# Custom label prefixes (one-liner)
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghprj | make -f - setup PRIORITY_PREFIX=p SEVERITY_PREFIX=sev

# Interactive label setup (one-liner)
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghprj | make -f - setup INTERACTIVE=true

# Local customization (in cloned repository)
make -f Makefile.ghprj setup PRIORITY_PREFIX=p SEVERITY_PREFIX=sev
make -f Makefile.ghprj setup INTERACTIVE=true
```

## 🔧 Environment & Configuration

### Actor Variables (act - local testing)
When running locally with `act`, workflows can detect the environment:
```yaml
- name: Environment Detection
  run: |
    if [ "$ACT" = "true" ]; then
      echo "🔬 Running locally with act"
    else  
      echo "☁️ Running on GitHub Actions"
    fi
```

### OpenCode Configuration
Located in `.opencode/opencode.jsonc`:
- **MCP servers** - context7, sequential_thinking
- **Permissions** - read, write, edit, bash allowed
- **External access** - controlled via permission settings

### GitHub Authentication
- **Local**: Run `gh auth login` for interactive authentication
- **Actions**: Uses `GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}` automatically  
- **OpenCode workflows**: Pass token via `GH_TOKEN="$GH_TOKEN"` in clean environments

## 🚀 Quick Commands Reference

### Makefile (Workflow Testing)
```bash
make help                     # Show all commands  
make setup                    # Install act + setup
make list                     # List workflows
make run-all                  # Run all workflows  
make validate                 # Validate syntax
make clean                    # Clean Docker cache
```

### Makefile.ghar (Auto-Routine)
```bash
make -f Makefile.ghar install    # Install automation  
make -f Makefile.ghar validate   # Validate setup
make -f Makefile.ghar info       # Show config
make -f Makefile.ghar clean      # Remove files
```

### Makefile.ghprj (Label Setup) 
```bash
make -f Makefile.ghprj setup           # Setup labels
make -f Makefile.ghprj setup-dry-run   # Preview changes
make -f Makefile.ghprj setup-list      # List current labels
```

### Makefile.team (Team Generation)
```bash  
make -f Makefile.team gen-opencode     # Generate agents  
make -f Makefile.team clean            # Clean generated files
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/amazing-feature`
3. Test changes locally: `make setup && make validate`  
4. Commit changes: `git commit -m 'Add amazing feature'`
5. Push to branch: `git push origin feature/amazing-feature`
6. Create Pull Request

### Development Guidelines
- **Test workflows locally** with `act` before committing
- **Validate Makefile syntax** - use consistent formatting  
- **Update documentation** - especially if adding new Makefiles
- **Follow naming conventions** - `examples-*.yml`, `Makefile.*`

## 📚 Resources

- [nektos/act](https://github.com/nektos/act) - Run GitHub Actions locally
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub CLI Documentation](https://cli.github.com/manual/)  
- [OpenCode Documentation](https://opencode.ai/docs)
- [Docker Documentation](https://docs.docker.com/)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🚀 **TL;DR: Essential One-Liner Commands**
```bash
# 🤖 Add auto-routine to any repository (most common use case)
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - install

# 🏷️ Setup GitHub project labels 
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghprj | make -f - setup

# 👥 Generate OpenCode agents (requires teams/ folder)
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.team | make -f - gen-opencode

# 🧪 Setup workflow testing (requires cloning)
git clone https://github.com/tbrandenburg/ghaw.git && cd ghaw && make setup && make run-all
```