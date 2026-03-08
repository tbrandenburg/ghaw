---
description: Execute an implementation plan with rigorous validation loops and real-time verification
agent: developer
---

---
description: Execute an implementation plan with rigorous validation loops and real-time verification
argument-hint: <path/to/plan.md>
---

# Implement Plan (Enhanced with Context7 MCP & Web Intelligence)

**Plan**: $ARGUMENTS

---

## Your Mission

Execute the plan end-to-end with rigorous self-validation and real-time verification. You are autonomous.

**Core Philosophy**: Validation loops catch mistakes early. Run checks after every change. Fix issues immediately. The goal is a working implementation that follows current best practices, not just code that exists.

**Golden Rule**: If a validation fails, fix it before moving on. Never accumulate broken state. Always prioritize current documentation over plan assumptions when conflicts arise.

**Validation Gate Lock**: If any planned validation command fails, STOP immediately, mark the phase FAILED, and remediate only that gate until it passes with exit code 0.

---

## Phase 0: DETECT - Project Environment

### 0.1 Identify Package Manager

Check for these files to determine the project's toolchain:

| File Found | Package Manager | Runner |
|------------|-----------------|--------|
| `bun.lockb` | bun | `bun` / `bun run` |
| `pnpm-lock.yaml` | pnpm | `pnpm` / `pnpm run` |
| `yarn.lock` | yarn | `yarn` / `yarn run` |
| `package-lock.json` | npm | `npm run` |
| `pyproject.toml` | uv/pip | `uv run` / `python` |
| `Cargo.toml` | cargo | `cargo` |
| `go.mod` | go | `go` |

**Store the detected runner** - use it for all subsequent commands.

### 0.2 Identify Validation Scripts

Check `package.json` (or equivalent) for available scripts:
- Type checking: `type-check`, `typecheck`, `tsc`
- Linting: `lint`, `lint:fix`
- Testing: `test`, `test:unit`, `test:integration`
- Building: `build`, `compile`

**Use the plan's "Validation Commands" section** - it should specify exact commands for this project.

---

## Phase 1: LOAD - Read the Plan

### 1.1 Load Plan File

```bash
cat $ARGUMENTS
```

### 1.2 Extract Key Sections

Locate and understand:
- **Summary** - What we're building
- **Patterns to Mirror** - Code to copy from
- **Files to Change** - CREATE/UPDATE list
- **Step-by-Step Tasks** - Implementation order
- **Validation Commands** - How to verify (USE THESE, not hardcoded commands)
- **Acceptance Criteria** - Definition of done

### 1.2.1 Initialize Task Tracking

**CRITICAL**: Use the agent's internal todo tool to track all tasks and sub-tasks from the plan. This prevents forgetting steps during implementation.

1. Extract all main tasks from the plan's "Step-by-Step Tasks" section
2. For each main task, identify any sub-tasks or validation steps
3. Add ALL tasks to the internal todo tool with clear descriptions
4. Mark tasks as complete only after full validation passes

### 1.2.5 Plan Currency Verification (Context7 MCP)

Before starting implementation, verify plan assumptions are still current:
- Check if documentation links in plan are still accessible
- Verify library versions haven't had breaking changes since plan creation
- Confirm security recommendations are up-to-date
- Validate API signatures match current documentation

### 1.3 Validate Plan Exists

**If plan not found:**
```
Error: Plan not found at $ARGUMENTS

Create a plan first: /prp-plan "feature description"
```

---

## Phase 2: PREPARE - Git State

### 2.1 Check Current State

```bash
git branch --show-current
git status --porcelain
git worktree list
```

### 2.2 Branch Decision

| Current State | Action |
|---------------|--------|
| In worktree | Use it (log: "Using worktree") |
| On main, clean | Create branch: `git checkout -b feature/{plan-slug}` |
| On main, dirty | STOP: "Stash or commit changes first" |
| On feature branch | Use it (log: "Using existing branch") |

### 2.3 Sync with Remote

```bash
git fetch origin
git pull --rebase origin main 2>/dev/null || true
```

---

## Phase 2.5: INTELLIGENCE - Pre-execution Validation

### 2.5.1 Plan Freshness Check

Use Context7 MCP to verify plan assumptions:
- Documentation links still valid and current
- Library versions haven't had breaking changes
- Security recommendations unchanged since plan creation

### 2.5.2 Dependency Security Scan

Quick web search for:
- Recent CVE reports for project dependencies
- Security advisories from library maintainers
- Known issues with specific version combinations

**If critical issues found:**
- STOP implementation
- Update plan or create new plan with current information
- Document why original plan was outdated

---

## Phase 3: EXECUTE - Implement Tasks

**For each task in the plan's Step-by-Step Tasks section:**

### 3.1 Read Context

1. Read the **MIRROR** file reference from the task
2. Understand the pattern to follow
3. Read any **IMPORTS** specified
4. **Verify current patterns (Context7 MCP):** Cross-check MIRROR patterns against live documentation
5. **Community validation:** Quick scan for recent issues with this implementation approach
6. **Security check:** Verify no recent vulnerabilities in dependencies being used

### 3.2 Implement

1. Make the change exactly as specified
2. Follow the pattern from MIRROR reference
3. Handle any **GOTCHA** warnings
4. Apply any current best practices discovered in verification

### 3.3 Validate Immediately

**After EVERY file change, run the validation commands from the plan's task specifications.**

Enhanced validation pattern (from plan):
- `{type-check-cmd} && {lint-cmd} && {build-cmd} && {functional-test-cmd} && {test-with-coverage-cmd}`

Common type-check patterns:
- `{runner} run type-check` (JS/TS projects)
- `mypy .` (Python)
- `cargo check` (Rust)
- `go build ./...` (Go)

**If types fail:**
1. Read the error
2. Fix the issue
3. Re-run type-check
4. Only proceed when passing

### 3.4 Track Progress

**Use the internal todo tool to track each task completion:**

1. Mark main task as in-progress when starting
2. Check off each sub-task as completed and validated
3. Only mark main task complete when ALL sub-tasks pass validation
4. Never skip or forget validation steps tracked in internal todos

**Deviation Handling:**
If you must deviate from the plan:
- Note WHAT changed
- Note WHY it changed (e.g., "package version didn't exist", "current documentation differs")
- **Note if deviation was due to current documentation**
- **Update affected internal todos to reflect the deviation**
- Continue with the deviation documented

---

## Phase 3.5: VERIFY - Real-time Implementation Validation

### 3.5.1 API Compatibility Check

Use Context7 MCP to verify:
- All API calls in implemented code match current documentation signatures
- No deprecated methods are being used
- Import statements reference current library exports

### 3.5.2 Security Validation

Quick web scan for:
- Recent security advisories for dependencies used
- Current security best practices for implemented patterns
- Known vulnerabilities in library versions

### 3.5.3 Community Intelligence

Check for:
- Recent Stack Overflow discussions about similar implementations
- GitHub issues related to the patterns being used
- Framework maintainer recommendations that might affect implementation

**If issues found:**
1. Document the discrepancy
2. Update implementation to match current standards
3. Note deviation in implementation log

---

## Phase 4: VALIDATE - Full Verification

### 4.1 Static Analysis

**Run the type-check and lint commands from the plan's Validation Commands section.**

Common patterns:
- JS/TS: `{runner} run type-check && {runner} run lint`
- Python: `ruff check . && mypy .`
- Rust: `cargo check && cargo clippy`
- Go: `go vet ./...`

**Must pass with zero errors.**

### 4.1.5 Current Standards Validation

Use Context7 MCP to verify implementation follows current best practices:
- Security patterns align with latest OWASP recommendations
- Performance patterns match current optimization techniques
- Testing approaches follow current framework recommendations

### 4.2 Unit Tests

**CRITICAL TEST COVERAGE REQUIREMENTS:**

**You MUST write or update tests for new code. This is not optional.**

**SMART TEST REQUIREMENTS:**
1. **Test what matters most**: Core business logic, error handling, edge cases
2. **Quality over quantity**: One test that catches real bugs > ten trivial tests
3. **No coverage gaming**: Don't write meaningless tests just to hit numbers
4. **Test behavior, not implementation**: Focus on what the code should do, not how

Write valuable tests, then run the test command from the plan with coverage.

Common patterns:
- JS/TS: `{runner} test -- --coverage` or `{runner} run test:coverage`
- Python: `pytest --cov=.` or `uv run pytest --cov=.`
- Rust: `cargo test` (with tarpaulin for coverage)
- Go: `go test -cover ./...`

**If tests fail:**
1. Read failure output
2. Determine: bug in implementation or bug in test?
3. Fix the actual issue (usually implementation)
4. Re-run tests
5. Repeat until green AND coverage target met

### 4.3 Build Check

**Run the build command from the plan's Validation Commands section.**

Common patterns:
- JS/TS: `{runner} run build`
- Python: N/A (interpreted) or `uv build`
- Rust: `cargo build --release`
- Go: `go build ./...`

**Must complete without errors.**

---

## Phase 5: REPORT - Create Implementation Report

### 5.1 Create Report Directory

```bash
mkdir -p .claude/PRPs/reports
```

### 5.2 Generate Report

**Path**: `.claude/PRPs/reports/{plan-name}-report.md`

```markdown
# Implementation Report

**Plan**: `$ARGUMENTS`
**Branch**: `{branch-name}`
**Date**: {YYYY-MM-DD}
**Status**: {COMPLETE | PARTIAL}

---

## Summary
{Brief description of what was implemented}

---

## Real-time Verification Results

| Check | Result | Details |
|-------|--------|---------|
| Documentation Currency | ✅/❌ | All references verified current |
| API Compatibility | ✅/❌ | Signatures match live documentation |
| Security Status | ✅/❌ | No vulnerabilities detected |
| Community Alignment | ✅/❌ | Follows current best practices |

## Context7 MCP Queries Made
- {Number} documentation verifications
- {Number} API compatibility checks
- {Number} security scans
- Last verification: {timestamp}

---

## Tasks Completed

| # | Task | File | Status |
|---|------|------|--------|
| 1 | {task description} | `src/x.ts` | ✅ |
| 2 | {task description} | `src/y.ts` | ✅ |

---

## Validation Results

| Check | Result | Details |
|-------|--------|---------|
| Type check | ✅ | No errors |
| Lint | ✅ | 0 errors, N warnings |
| Unit tests | ✅ | X passed, 0 failed |
| Build | ✅ | Compiled successfully |
| Current Standards | ✅ | Verified against live documentation |

---

## Files Changed

| File | Action | Lines |
|------|--------|-------|
| `src/x.ts` | CREATE | +{N} |
| `src/y.ts` | UPDATE | +{N}/-{M} |

---

## Deviations from Plan
{List any deviations with rationale, including those due to current documentation, or "None"}

---

## Next Steps
- [ ] Review implementation
- [ ] Create PR: `gh pr create` (if applicable)
- [ ] Merge when approved
```

### 5.3 Update Source PRD (if applicable)

**Check if plan was generated from a PRD:**
- Look in the plan file for `Source PRD:` reference
- Or check if plan filename matches a phase pattern

**If PRD source exists:**
1. Read the PRD file
2. Find the phase row in the Implementation Phases table
3. Update the phase: Change Status from `in-progress` to `complete`
4. Save the PRD

### 5.4 Archive Plan

```bash
mkdir -p .claude/PRPs/plans/completed
mv $ARGUMENTS .claude/PRPs/plans/completed/
```

---

## Phase 6: OUTPUT - Report to User

```markdown
## Implementation Complete

**Plan**: `$ARGUMENTS`
**Branch**: `{branch-name}`
**Status**: ✅ Complete

### Validation Summary

| Check | Result |
|-------|--------|
| Type check | ✅ |
| Lint | ✅ |
| Tests | ✅ ({N} passed) |
| Build | ✅ |
| Current Standards | ✅ |

### Real-time Verification
- **Documentation**: All references verified current
- **Security**: No vulnerabilities detected
- **Community**: Follows latest best practices

### Files Changed
- {N} files created
- {M} files updated
- {K} tests written

### Deviations
{If none: "Implementation matched the plan."}
{If any: Brief summary of what changed and why, including current documentation updates}

### Artifacts
- Report: `.claude/PRPs/reports/{name}-report.md`
- Plan archived to: `.claude/PRPs/plans/completed/`

### Next Steps
1. Review the report (especially if deviations noted)
2. Create PR: `gh pr create` or `/prp-pr`
3. Merge when approved
```

---

## Handling Failures

### Type Check Fails
1. Read error message carefully
2. Fix the type issue
3. Re-run the type-check command
4. Don't proceed until passing

### Tests Fail
1. Identify which test failed
2. Determine: implementation bug or test bug?
3. Fix the root cause (usually implementation)
4. Re-run tests
5. Repeat until green
6. **CRITICAL: Never ignore, skip, or suppress failing tests**

### Documentation Mismatch (Context7 MCP)
1. Live documentation differs from plan assumptions
2. Update implementation to match current API
3. Document the change as deviation from plan
4. Re-run verification

### Security Advisory Found (Web Search)
1. Vulnerability detected in dependency or pattern
2. Update to secure version or alternative approach
3. Re-run security validation
4. Document security fix in report

---

## Success Criteria

- **TASKS_COMPLETE**: All plan tasks executed
- **TYPES_PASS**: Type-check command exits 0
- **LINT_PASS**: Lint command exits 0 (warnings OK)
- **TESTS_PASS**: Test command all green
- **BUILD_PASS**: Build command succeeds
- **REPORT_CREATED**: Implementation report exists
- **PLAN_ARCHIVED**: Original plan moved to completed
- **CURRENT_STANDARDS**: Implementation verified against live documentation
- **SECURITY_CLEAN**: No vulnerabilities detected in dependencies
