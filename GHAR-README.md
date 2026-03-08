# GitHub Auto-Routine (GHAR) - Daily Routine Installer

A one-liner installer that adds automated daily routine workflows to any GitHub repository. This system automatically checks for stale PRs and issues and notifies repository owners.

## 🚀 One-Liner Installation

Install the daily routine workflow in your repository with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - install
```

## 📋 What Gets Installed

The installer automatically downloads and configures:

- **Daily Routine Workflow** (`.github/workflows/ghar-daily-routine.yml`)
  - Runs daily at 9:00 AM UTC
  - Can be triggered manually via GitHub Actions
  
- **OpenCode Runner** (`.github/workflows/opencode-run.yml`) 
  - Required dependency for running OpenCode commands
  - Only downloaded if not already present

- **Stale Check Command** (`.opencode/commands/ghar-stale-check.md`)
  - Automatically configured with your repository owner
  - Checks for PRs inactive >14 days and issues >30 days

## 🎯 Features

- **Automatic Owner Detection** - Detects your GitHub username from git remote
- **Smart Configuration** - Replaces template owner with your username
- **Zero Configuration** - Works out of the box after installation
- **Customizable** - Easy to modify schedules and thresholds
- **Safe Installation** - Won't overwrite existing `opencode-run.yml`

## 📖 Usage Examples

### Basic Installation
```bash
# Install in current repository
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - install
```

### Custom Source Repository
```bash
# Install from a different source repo
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - install SOURCE_REPO=yourusername/yourrepo
```

### Installation with Custom Branch
```bash
# Install from a specific branch
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - install SOURCE_BRANCH=develop
```

### Other Commands
```bash
# View help
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - help

# Check configuration
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - info

# Remove installed files
curl -fsSL https://raw.githubusercontent.com/tbrandenburg/ghaw/main/Makefile.ghar | make -f - clean
```

## ⚡ After Installation

1. **Commit the new files:**
   ```bash
   git add .github .opencode
   git commit -m "Add daily routine workflow for stale PR/issue management"
   git push
   ```

2. **Test the workflow:**
   - Go to your repository's "Actions" tab
   - Find "Daily Routine - Stale Check"
   - Click "Run workflow" to test manually

3. **Customize if needed:**
   - Edit `.github/workflows/ghar-daily-routine.yml` to change the schedule
   - Modify `.opencode/commands/ghar-stale-check.md` to adjust thresholds

## 🔧 Customization

### Change Schedule
Edit the cron expression in `ghar-daily-routine.yml`:
```yaml
schedule:
  - cron: '0 12 * * *'  # Daily at noon UTC
  - cron: '0 9 * * 1-5'  # Weekdays at 9 AM UTC
```

### Adjust Thresholds
Modify the days in `ghar-stale-check.md`:
- Change "14 days" for PR threshold
- Change "30 days" for issue threshold

## 🛡️ Requirements

- Repository must be a Git repository
- Repository must have a GitHub remote configured
- Repository needs GitHub Actions enabled
- `curl` and `make` must be available

## 🤝 Contributing

Found a bug or want to improve GHAR? 
1. Fork the repository
2. Make your changes
3. Test with your own repositories
4. Submit a pull request

## 📄 License

This project follows the same license as the source repository.