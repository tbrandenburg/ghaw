# GHAW Documentation

Documentation for the GitHub Actions Workflow (GHAW) project.

## 📚 Available Documentation

### [Issue Workflow States & Scrum Integration](workflow-states.md)
Comprehensive guide to issue state management, ownership responsibilities, and Scrum ceremony integration.

**Contents:**
- Issue state management table with ownership and triggers
- Detailed state descriptions and criteria
- Scrum ceremony integration
- Workflow progression and best practices
- Setup and configuration instructions

## 🎯 Quick Reference

### Issue Workflow States
```
open → ready → in-progress → reviewed → closed
                                    ↓
                              (+ released metadata)
```

### Key Ownership
- **Product Owner**: `open` → `ready` & final PR approval
- **Development Team**: `ready` → `in-progress` → `reviewed`
- **GitHub/System**: `reviewed` → `closed` (automatic via PR merge)

### Setup Commands
```bash
# Setup workflow labels
make -f Makefile.ghprj setup

# Interactive setup with prefix options
make -f Makefile.ghprj setup INTERACTIVE=true

# Dry run preview
make -f Makefile.ghprj setup-dry-run
```

## 🔗 Related Files

- [`Makefile.ghprj`](../Makefile.ghprj) - GitHub project workflow label setup
- [`Makefile`](../Makefile) - Main GHAW commands for GitHub Actions testing
- [`.github/workflows/`](../.github/workflows/) - GitHub Actions workflow definitions