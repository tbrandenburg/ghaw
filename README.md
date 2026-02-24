# GHAW - GitHub Actions Workflow

**GitHub Actions Workflow** - A streamlined project for testing and running GitHub Actions workflows locally using `act`.

## 🚀 Quick Start

```bash
# Install dependencies and setup project
make setup

# List available workflows
make list

# Run all workflows locally
make run-all

# Run specific workflows
make run-hello                    # Simple hello world
make run-opencode-simple         # Basic OpenCode test
make run-opencode-enhanced       # Enhanced OpenCode with security review
```

## 📋 Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Available Workflows](#available-workflows)
- [Makefile Commands](#makefile-commands)
- [Configuration](#configuration)
- [Development](#development)
- [Troubleshooting](#troubleshooting)

## 🎯 Overview

This project demonstrates how to:
- Create and test GitHub Actions workflows locally using `act`
- Run OpenCode AI workflows for automated code reviews
- Perform security and safety reviews with AI assistance
- Use a simplified Makefile for common workflow operations
- Validate workflow configurations before deploying

## 📄 Available Workflows

### 1. Simple Hello (`simple-hello.yml`)
- **Command**: `make run-hello`
- **Triggers**: `push`, `workflow_dispatch`
- **Purpose**: Basic demonstration workflow that outputs "Hello World!"

### 2. Simple OpenCode (`simple-opencode.yml`) 
- **Command**: `make run-opencode-simple`
- **Triggers**: `push`, `workflow_dispatch`
- **Purpose**: Basic OpenCode installation and test
- **Features**: Installs OpenCode, configures it, runs simple test

### 3. Enhanced OpenCode (`enhanced-opencode.yml`)
- **Command**: `make run-opencode-enhanced`
- **Triggers**: `push`, `workflow_dispatch`
- **Purpose**: Comprehensive OpenCode workflow with multiple review stages
- **Features**: 
  - Setup and installation verification
  - Security review job
  - Safety review job (additional validation)

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Docker** - Required for `act` to run workflows in containers
- **Git** - For version control
- **make** - For using the Makefile commands (usually pre-installed on Linux/macOS)

### Docker Installation
- **Linux**: Follow [Docker's official installation guide](https://docs.docker.com/engine/install/)
- **macOS**: Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- **Windows**: Install [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## 🛠 Installation

### Option 1: Automatic Setup (Recommended)
```bash
# Clone the repository
git clone <repository-url>
cd ghaw

# Automatic setup - installs act and sets up the project
make setup
```

### Option 2: Manual Installation
```bash
# Install act manually
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Or using package managers:
# Homebrew (macOS): brew install act
# Chocolatey (Windows): choco install act-cli
# GitHub CLI: gh extension install https://github.com/nektos/gh-act

# Verify installation
act --version
```

## 🎮 Usage

### Basic Commands

```bash
# List all available workflows and jobs
make list
# or directly with act
act -l

# Run all workflows (push event trigger)
make run-all

# Run specific workflows
make run-hello
make run-opencode-simple  
make run-opencode-enhanced

# Validate workflow syntax
make validate
```

### Advanced Usage with Act

```bash
# Run workflows manually with act
act push                                              # All push event workflows
act workflow_dispatch                                 # All manual trigger workflows
act -W .github/workflows/simple-hello.yml           # Specific workflow file
act -j simple-hello                                 # Specific job name

# Use specific Docker images
act -P ubuntu-latest=catthehacker/ubuntu:act-latest

# Run with environment variables
act push --env CUSTOM_VAR=value
```

## 📄 Available Workflows

### 1. Simple Hello (`simple-hello.yml`)
- **Command**: `make run-hello`
- **Triggers**: `push`, `workflow_dispatch`
- **Purpose**: Basic demonstration workflow that outputs "Hello World!"

### 2. Simple OpenCode (`simple-opencode.yml`) 
- **Command**: `make run-opencode-simple`
- **Triggers**: `push`, `workflow_dispatch`
- **Purpose**: Basic OpenCode installation and test
- **Features**: Installs OpenCode, configures it, runs simple test

### 3. Enhanced OpenCode (`enhanced-opencode.yml`)
- **Command**: `make run-opencode-enhanced`
- **Triggers**: `push`, `workflow_dispatch`
- **Purpose**: Comprehensive OpenCode workflow with multiple review stages
- **Features**: 
  - Setup and installation verification
  - Security review job
  - Safety review job (additional validation)

## 🔧 Makefile Commands

Run `make help` to see all available commands:

### Setup & Management
| Command | Description |
|---------|-------------|
| `make setup` | Install act CLI and setup project directories |
| `make list` | List available workflows and jobs |
| `make validate` | Validate workflow syntax |
| `make clean` | Clean Docker containers and act cache |

### Workflow Execution
| Command | Description |
|---------|-------------|
| `make run-all` | Run all workflows (push event) |
| `make run-hello` | Run simple hello world workflow |
| `make run-opencode-simple` | Run basic OpenCode workflow |
| `make run-opencode-enhanced` | Run enhanced OpenCode with security/safety reviews |

## ⚙️ Configuration

### OpenCode Configuration
The project includes OpenCode configuration files in `.github/opencode/`:
- `config.json` - OpenCode settings and model configuration

### Project Structure
```
ghaw/
├── .github/
│   ├── opencode/          # OpenCode configuration files
│   ├── prompts/           # AI prompt templates  
│   └── workflows/         # GitHub Actions workflows
│       ├── simple-hello.yml
│       ├── simple-opencode.yml
│       └── enhanced-opencode.yml
├── Makefile              # Simplified command interface
├── README.md            # Project documentation
└── LICENSE              # MIT License
```

## 🚀 Development

### Adding New Workflows

1. Create a new workflow file in `.github/workflows/`:
```yaml
name: My New Workflow
on: 
  push:
  workflow_dispatch:
jobs:
  my-job:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: echo "Hello from new workflow!"
```

2. Test the workflow locally:
```bash
make run-all
# or for specific workflow
act -W .github/workflows/my-new-workflow.yml
```

3. Add a Makefile command (optional):
```makefile
run-my-workflow: ## Run my new workflow
	@echo "🚀 Running my workflow..."
	@act workflow_dispatch -W .github/workflows/my-new-workflow.yml
```

### Environment Detection
Workflows can detect if they're running locally with `act`:

```yaml
- name: Environment check
  run: |
    if [ "$ACT" = "true" ]; then
      echo "Running locally with act"
    else
      echo "Running on GitHub Actions"
    fi
```

### OpenCode Integration
To add OpenCode AI reviews to your workflows:

```yaml
- name: Install OpenCode
  run: |
    curl -fsSL https://opencode.ai/install | bash
    echo "$HOME/.opencode/bin" >> $GITHUB_PATH

- name: Configure OpenCode  
  run: |
    mkdir -p "$HOME/.config/opencode"
    cp .github/opencode/config.json "$HOME/.config/opencode/config.json"

- name: Run AI Review
  run: |
    opencode --model "opencode/big-pickle" run 'Review this code for security issues'
```

## 🔍 Troubleshooting

### Common Issues

**1. "act: command not found"**
```bash
# Install act via the setup command
make setup

# Or install manually
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

**2. "Docker daemon not running"**
```bash
# Start Docker service (Linux)
sudo systemctl start docker

# Or start Docker Desktop manually on macOS/Windows
```

**3. "No workflows found"**
```bash
# Check if workflows exist
ls .github/workflows/

# List available workflows
make list
```

**4. OpenCode installation fails**
```bash
# Check if curl is available
curl --version

# Manually install OpenCode
curl -fsSL https://opencode.ai/install | bash
```

**5. Permission denied errors**
```bash
# Fix Docker permissions (Linux)
sudo usermod -aG docker $USER
# Logout and login again

# Or run with sudo (not recommended)
sudo make run-all
```

### Debug Commands
```bash
# Show available workflows
make list

# Validate workflow syntax
make validate

# Clean Docker resources
make clean

# Check act version
act --version
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Add your workflows in `.github/workflows/`
4. Test locally: `make test-workflows`
5. Commit your changes: `git commit -am 'Add feature'`
6. Push to the branch: `git push origin feature-name`
7. Create a Pull Request

## 📚 Resources

- [act GitHub Repository](https://github.com/nektos/act)
- [act Documentation](https://nektosact.com)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Docker Documentation](https://docs.docker.com/)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Quick Commands Reference:**
```bash
make setup                 # Setup project and install act
make list                  # List workflows  
make run-all              # Run all workflows
make run-hello            # Run hello world workflow
make run-opencode-simple  # Run basic OpenCode test
make run-opencode-enhanced # Run enhanced OpenCode with reviews
make validate             # Validate workflow syntax
make clean                # Clean Docker resources
make help                 # Show all commands
```