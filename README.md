# GHAW - GitHub Actions Workflow

**GitHub Workflow based agent workflows** - A project for testing and running GitHub Actions locally using `act`.

## 🚀 Quick Start

```bash
# Install dependencies and setup project
make setup

# Run all workflows locally
make run-all

# List available workflows
make list
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
- Create GitHub Actions workflows
- Test workflows locally using `act`
- Manage workflows with a comprehensive Makefile
- Use environment variables and secrets in workflows
- Debug and validate workflow configurations

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
# or
act -l

# Run all workflows (default: push event)
make run-all
# or
act push

# Run specific job
make run-job JOB=hello-world
# or
act -j hello-world

# Run with manual trigger
make run-manual
# or
act workflow_dispatch
```

### Event Triggers

```bash
# Push event (default)
make run-push

# Pull request event
make run-pr

# Manual trigger (workflow_dispatch)
make run-manual

# Scheduled workflows
make run-schedule
```

### Advanced Usage

```bash
# Run in offline mode (use cached images)
make run-offline

# Run with verbose output for debugging
make debug

# Dry run (show execution plan without running)
make dry-run

# Run with secrets file
make run-with-secrets

# Run with variables file
make run-with-vars
```

## 📄 Available Workflows

### Hello World Workflow
- **File**: `.github/workflows/hello-world.yml`
- **Triggers**: `push`, `pull_request`, `workflow_dispatch`
- **Purpose**: Simple demonstration workflow that echoes "Hello World!"

**Features:**
- ✅ Checkout repository code
- ✅ Echo messages with environment info  
- ✅ Show GitHub context variables
- ✅ Detect local vs GitHub execution (`ACT` environment variable)

## 🔧 Makefile Commands

Run `make help` to see all available commands. Here are the main categories:

### Setup & Installation
| Command | Description |
|---------|-------------|
| `make setup` | Initial project setup |
| `make install-act` | Install act CLI tool |
| `make check-act` | Check if act is installed |
| `make dev-setup` | Complete development setup |

### Workflow Management
| Command | Description |
|---------|-------------|
| `make list` | List available workflows and jobs |
| `make validate-workflows` | Validate workflow syntax |
| `make run-all` | Run all workflows |
| `make run-push` | Run push event workflows |
| `make run-manual` | Run manual workflows |
| `make run-job JOB=name` | Run specific job |

### Development & Debugging
| Command | Description |
|---------|-------------|
| `make debug` | Run with verbose output |
| `make dry-run` | Show execution plan |
| `make test-workflows` | Validate and test all workflows |
| `make inspect-workflow FILE=name` | Inspect specific workflow |

### Configuration & Cleanup
| Command | Description |
|---------|-------------|
| `make create-secrets-template` | Create .secrets template |
| `make create-vars-template` | Create .vars template |
| `make clean-docker` | Clean Docker containers/images |
| `make clean-cache` | Clean act cache |

## ⚙️ Configuration

### Secrets Configuration
Create a `.secrets` file for sensitive data:

```bash
# Create template
make create-secrets-template

# Edit the file
# .secrets
GITHUB_TOKEN=your_personal_access_token
MY_SECRET=secret_value
```

### Variables Configuration
Create a `.vars` file for environment variables:

```bash
# Create template  
make create-vars-template

# Edit the file
# .vars
ENVIRONMENT=development
VERSION=1.0.0
API_URL=https://api.example.com
```

### Act Configuration (.actrc)
Create a `.actrc` file for act-specific settings:

```bash
# Create configuration file
make create-actrc

# .actrc
--action-offline-mode
--container-architecture=linux/amd64
```

## 🚀 Development

### Adding New Workflows

1. Create a new workflow file in `.github/workflows/`:
```yaml
name: My New Workflow
on: 
  push:
    branches: [main]
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
```

3. Validate the workflow:
```bash
make validate-workflows
```

### Environment Detection
Use the `ACT` environment variable to detect local execution:

```yaml
- name: Environment check
  run: |
    if [ "$ACT" = "true" ]; then
      echo "Running locally with act"
    else
      echo "Running on GitHub Actions"
    fi
```

### Conditional Steps
Skip steps in local testing:

```yaml
- name: Deploy (GitHub only)
  if: ${{ !env.ACT }}
  run: echo "This only runs on GitHub"

- name: Local test
  if: ${{ env.ACT }}
  run: echo "This only runs locally"
```

## 🔍 Troubleshooting

### Common Issues

**1. "act: command not found"**
```bash
make install-act
# or manually install act
```

**2. "Docker daemon not running"**
```bash
# Start Docker service
sudo systemctl start docker  # Linux
# or start Docker Desktop manually
```

**3. "No workflows found"**
```bash
# Ensure workflows exist
ls .github/workflows/
make validate-workflows
```

**4. "Permission denied"**
```bash
# Fix Docker permissions (Linux)
sudo usermod -aG docker $USER
# Logout and login again
```

### Debug Information
```bash
# Show project information
make info

# Run with debug output
make debug

# Check act version and status
make check-act
```

### Getting Help
```bash
# Show Makefile commands
make help

# Show act help
act --help

# List workflows verbosely  
act -l --verbose
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
make setup      # Setup project
make list       # List workflows  
make run-all    # Run all workflows
make help       # Show all commands
```