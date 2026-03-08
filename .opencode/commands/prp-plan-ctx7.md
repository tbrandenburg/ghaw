---
description: Create comprehensive feature implementation plan with codebase analysis, real-time research, and current best practices validation
agent: developer
---

---
description: Create comprehensive feature implementation plan with codebase analysis, real-time research, and current best practices validation
argument-hint: <feature description | path/to/prd.md>
---

# Create Implementation Plan (Enhanced with Context7 MCP & Web Intelligence)

**Input**: $ARGUMENTS

---

## Your Mission

Transform the input into a battle-tested implementation plan through systematic codebase exploration, real-time pattern validation, and current intelligence gathering.

**Core Principle**: PLAN ONLY - no code written. Create a context-rich document with current information that enables one-pass implementation success.

**Execution Order**: CODEBASE FIRST, REAL-TIME RESEARCH SECOND. Solutions must fit existing patterns before introducing new ones, verified against current standards.

**Agent Strategy**: Use Task tool with subagent_type="Explore" for codebase intelligence gathering. Use Context7 MCP and web search for real-time validation and current best practices.

---

## Phase 0: DETECT - Input Type Resolution

**Determine input type:**

| Input Pattern | Type | Action |
|---------------|------|--------|
| Ends with `.prd.md` | PRD file | Parse PRD, select next phase |
| File path that exists | Document | Read and extract feature description |
| Free-form text | Description | Use directly as feature input |

### If PRD File Detected:
1. Read the PRD file
2. Parse Implementation Phases table - find rows with `Status: pending`
3. Check dependencies - only select phases whose dependencies are `complete`
4. Select the next actionable phase

### If Free-form or Conversation Context:
- Proceed directly to Phase 1 with the input as feature description

---

## Phase 1: PARSE - Feature Understanding

**EXTRACT from input:**
- Core problem being solved
- User value and business impact
- Feature type: NEW_CAPABILITY | ENHANCEMENT | REFACTOR | BUG_FIX
- Complexity: LOW | MEDIUM | HIGH
- Affected systems list

**FORMULATE user story:**
```
As a <user type>
I want to <action/goal>
So that <benefit/value>
```

---

## Phase 2: EXPLORE - Codebase Intelligence

**CRITICAL: Use Task tool with subagent_type="Explore" and thoroughness="very thorough"**

Example Task invocation:
```
Explore the codebase to find patterns, conventions, and integration points
relevant to implementing: [feature description].

DISCOVER:
1. Similar implementations - find analogous features with file:line references
2. Naming conventions - extract actual examples of function/class/file naming
3. Error handling patterns - how errors are created, thrown, caught
4. Logging patterns - logger usage, message formats
5. Type definitions - relevant interfaces and types
6. Test patterns - test file structure, assertion styles
7. Integration points - where new code connects to existing
8. Dependencies - relevant libraries already in use
9. Governed commands - Makefile targets and package scripts for lint/test/build

Return ACTUAL code snippets from codebase, not generic examples.
```

**DOCUMENT discoveries in table format:**

| Category | File:Lines | Pattern Description | Code Snippet |
|----------|------------|-------------------|--------------|
| NAMING   | `src/features/X/service.ts:10-15` | camelCase functions | `export function createThing()` |
| ERRORS   | `src/features/X/errors.ts:5-20` | Custom error classes | `class ThingNotFoundError` |
| LOGGING  | `src/core/logging/index.ts:1-10` | getLogger pattern | `const logger = getLogger("domain")` |

### Pattern Currency Verification (Context7 MCP)

After codebase exploration, verify discovered patterns against current standards:
- Check if discovered libraries have newer recommended patterns
- Validate security practices are still current
- Confirm performance patterns haven't been superseded

---

## Phase 3: RESEARCH - Real-time External Intelligence

**ONLY AFTER Phase 2 is complete** - solutions must fit existing codebase patterns first.

**Context7 MCP Documentation Access:**
- Query live API documentation for exact current signatures
- Access version-specific implementation guides
- Retrieve current security best practices
- Verify compatibility matrices and breaking changes

**Web Intelligence Gathering:**
- Recent Stack Overflow solutions and community discussions
- Framework-specific forums and maintainer recommendations
- Current performance benchmarks and optimization techniques
- Security advisories and vulnerability reports

---

## Phase 4: DESIGN - UX Transformation

**CREATE ASCII diagrams showing user experience before and after:**

```
╔═══════════════════════════════════════════════════════════════════════════════╗
║                              BEFORE STATE                                      ║
╠═══════════════════════════════════════════════════════════════════════════════╣
║   ┌─────────────┐         ┌─────────────┐         ┌─────────────┐            ║
║   │   Screen/   │ ──────► │   Action    │ ──────► │   Result    │            ║
║   │  Component  │         │   Current   │         │   Current   │            ║
║   └─────────────┘         └─────────────┘         └─────────────┘            ║
║                                                                               ║
║   USER_FLOW: [describe current step-by-step experience]                       ║
║   PAIN_POINT: [what's missing, broken, or inefficient]                        ║
╚═══════════════════════════════════════════════════════════════════════════════╝

╔═══════════════════════════════════════════════════════════════════════════════╗
║                               AFTER STATE                                      ║
╠═══════════════════════════════════════════════════════════════════════════════╣
║   ┌─────────────┐         ┌─────────────┐         ┌─────────────┐            ║
║   │   Screen/   │ ──────► │   Action    │ ──────► │   Result    │            ║
║   │  Component  │         │    NEW      │         │    NEW      │            ║
║   └─────────────┘         └─────────────┘         └─────────────┘            ║
║                                   │                                           ║
║                                   ▼                                           ║
║                          ┌─────────────┐                                      ║
║                          │ NEW_FEATURE │  ◄── [new capability added]          ║
║                          └─────────────┘                                      ║
╚═══════════════════════════════════════════════════════════════════════════════╝
```

---

## Phase 5: ARCHITECT - Strategic Design

**ANALYZE deeply:**
- ARCHITECTURE_FIT: How does this integrate with the existing architecture?
- EXECUTION_ORDER: What must happen first → second → third?
- FAILURE_MODES: Edge cases, race conditions, error scenarios?
- PERFORMANCE: Will this scale? Database queries optimized?
- SECURITY: Attack vectors? Data exposure risks? Auth/authz?
- MAINTAINABILITY: Will future devs understand this code?

**Real-time Best Practices Validation (Context7 MCP + Web Search):**
- SECURITY: Query current OWASP recommendations and recent CVEs
- PERFORMANCE: Check for recent optimization techniques and benchmarks
- ARCHITECTURE: Validate against current framework recommendations

---

## Phase 6: GENERATE - Implementation Plan File

**OUTPUT_PATH**: `.claude/PRPs/plans/{kebab-case-feature-name}.plan.md`

Create directory if needed: `mkdir -p .claude/PRPs/plans`

### Plan Currency Validation

Before finalizing plan, use Context7 MCP to verify:
- All documentation links are current and accessible
- Library versions match latest stable releases
- Security recommendations haven't changed
- No deprecated patterns are being recommended

**PLAN_STRUCTURE** (the template to fill and save):

```markdown
# Feature: {Feature Name}

## Summary
{One paragraph: What we're building and high-level approach}

## User Story
As a {user type}
I want to {action}
So that {benefit}

## Problem Statement
{Specific problem this solves - must be testable}

## Solution Statement
{How we're solving it - architecture overview}

## Metadata
| Field | Value |
|-------|-------|
| Type | NEW_CAPABILITY / ENHANCEMENT / REFACTOR / BUG_FIX |
| Complexity | LOW / MEDIUM / HIGH |
| Systems Affected | {comma-separated list} |
| Dependencies | {external libs/services with versions} |
| Estimated Tasks | {count} |
| Research Timestamp | {Current date/time for context freshness} |

---

## UX Design

### Before State
{ASCII diagram - current user experience with data flows}

### After State
{ASCII diagram - new user experience with data flows}

### Interaction Changes
| Location | Before | After | User Impact |
|----------|--------|-------|-------------|
| {path/component} | {old behavior} | {new behavior} | {what changes for user} |

---

## Mandatory Reading

**CRITICAL: Implementation agent MUST read these files before starting any task:**

| Priority | File | Lines | Why Read This |
|----------|------|-------|---------------|
| P0 | `path/to/critical.ts` | 10-50 | Pattern to MIRROR exactly |
| P1 | `path/to/types.ts` | 1-30 | Types to IMPORT |
| P2 | `path/to/test.ts` | all | Test pattern to FOLLOW |

**Current External Documentation (Verified Live):**
| Source | Section | Why Needed | Last Verified |
|--------|---------|------------|---------------|
| [Lib Docs v{version}](url#anchor) ✓ Current | {section name} | {specific reason} | {timestamp} |

---

## Patterns to Mirror

**NAMING_CONVENTION:**
```typescript
// SOURCE: src/features/example/service.ts:10-15
// COPY THIS PATTERN:
{actual code snippet from codebase}
```

**ERROR_HANDLING:**
```typescript
// SOURCE: src/features/example/errors.ts:5-20
// COPY THIS PATTERN:
{actual code snippet from codebase}
```

**TEST_STRUCTURE:**
```typescript
// SOURCE: src/features/example/tests/service.test.ts:1-25
// COPY THIS PATTERN:
{actual code snippet from codebase}
```

---

## Files to Change

| File | Action | Justification |
|------|--------|---------------|
| `src/features/new/models.ts` | CREATE | Type definitions - re-export from schema |
| `src/features/new/service.ts` | CREATE | Business logic |
| `src/core/database/schema.ts` | UPDATE | Add table definition |

---

## Step-by-Step Tasks

Execute in order. Each task is atomic and independently verifiable.

### Task 1: CREATE `src/core/database/schema.ts` (update)
- **ACTION**: ADD table definition to schema
- **IMPLEMENT**: {specific columns, types, constraints}
- **MIRROR**: `src/core/database/schema.ts:XX-YY` - follow existing table pattern
- **VALIDATE**: `{type-check-cmd} && {build-cmd} && {test-cmd}`
- **FUNCTIONAL**: `{actual-usage-command}` - verify component works

### Task 2: CREATE `src/features/new/models.ts`
- **ACTION**: CREATE type definitions file
- **IMPLEMENT**: Re-export table, define inferred types
- **MIRROR**: `src/features/projects/models.ts:1-10`
- **VALIDATE**: `npx tsc --noEmit`

### Task N: CREATE Tests
- **ACTION**: CREATE comprehensive test suite
- **IMPLEMENT**: Test happy path, edge cases, error scenarios
- **MIRROR**: existing test patterns
- **VALIDATE**: `{test-cmd} -- --coverage`

---

## Testing Strategy

### Unit Tests to Write
| Test File | Test Cases | Validates |
|-----------|------------|-----------|
| `src/features/new/tests/service.test.ts` | CRUD ops, access control | Business logic |

### Edge Cases Checklist
- [ ] Empty string inputs
- [ ] Missing required fields
- [ ] Unauthorized access attempts
- [ ] Not found scenarios

---

## Validation Commands

Replace these placeholders with actual governed commands from the project's Makefile or package.json:

### Level 1: STATIC_ANALYSIS
```bash
{runner} run lint && {runner} run type-check
```

### Level 2: BUILD_AND_FUNCTIONAL
```bash
{runner} run build && {functional-test-command}
```

### Level 3: UNIT_TESTS
```bash
{runner} test -- --coverage {path/to/feature/tests}
```

---

## Acceptance Criteria
- [ ] All specified functionality implemented per user story
- [ ] Level 1-3 validation commands pass with exit 0
- [ ] Unit tests cover >= 80% of new code
- [ ] Code mirrors existing patterns exactly
- [ ] Implementation follows current best practices
- [ ] No deprecated patterns or vulnerable dependencies

---

## Real-time Intelligence Summary
**Context7 MCP Queries Made**: {Number of documentation queries}
**Web Intelligence Sources**: {Number of community sources consulted}
**Last Verification**: {Timestamp of most recent documentation check}
**Security Advisories Checked**: {Number of security checks performed}
**Deprecated Patterns Avoided**: {List of outdated patterns identified and avoided}

---

## Risks and Mitigations
| Risk | Likelihood | Impact | Mitigation |
|------|------------|---------|------------|
| {Risk description} | LOW/MED/HIGH | LOW/MED/HIGH | {Specific prevention/handling strategy} |
| Documentation changes during implementation | LOW | MEDIUM | Context7 MCP re-verification during execution |

---

## Notes
{Additional context, design decisions, trade-offs, future considerations}

### Current Intelligence Considerations
{Document any recent library updates, security patches, or community recommendations that influenced the plan}
```

---

## Success Criteria

- **CONTEXT_COMPLETE**: All patterns, gotchas, integration points documented from actual codebase
- **IMPLEMENTATION_READY**: Tasks executable top-to-bottom without questions
- **PATTERN_FAITHFUL**: Every new file mirrors existing codebase style exactly
- **VALIDATION_DEFINED**: Every task has executable verification command
- **CURRENCY_VERIFIED**: All information verified as current through Context7 MCP and web intelligence
- **ONE_PASS_TARGET**: Confidence score 8+ indicates high likelihood of first-attempt success
