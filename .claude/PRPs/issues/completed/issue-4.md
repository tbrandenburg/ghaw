# Investigation: Issue #4

## Issue Details

- **Number**: #4
- **Title**: Improve error handling and debugging information for HTTP 422 and other API failures
- **Type**: ENHANCEMENT
- **URL**: https://github.com/tbrandenburg/ghaw/issues/4

## Assessment

| Metric | Value | Reasoning |
|--------|-------|-----------|
| Priority | MEDIUM | Improves usability and debugging but doesn't block core functionality |
| Complexity | MEDIUM | Changes isolated to Makefile.ghprj; no new dependencies |
| Confidence | HIGH | Root cause clearly identified; solution is straightforward |

## Root Cause

Lines 545-546 and 549-550 redirect both stdout and stderr to `/dev/null`, hiding all error information.

## Files Modified

| File | Action |
|------|--------|
| `Makefile.ghprj` | UPDATE - Add VERBOSE/DEBUG config, error handling |

## Implementation Steps

1. Add VERBOSE configuration option
2. Add DEBUG configuration option  
3. Modify PATCH API call to capture response
4. Modify POST API call to capture response
5. Add error output with label details
6. Test dry-run, verbose, and debug modes

## Changes Made

- Added `VERBOSE ?= false` configuration (line 75)
- Added `DEBUG ?= false` configuration (line 78)
- Modified lines 541-570 to capture API response on failure
- Added error output showing label name, parameters, and full response

## Validation Commands

```bash
# Syntax check
make -f Makefile.ghprj --dry-run

# Dry-run test
make -f Makefile.ghprj setup-dry-run REPO=owner/repo

# Verbose mode
make -f Makefile.ghprj setup REPO=owner/repo VERBOSE=true

# Debug mode  
make -f Makefile.ghprj setup REPO=owner/repo DEBUG=true
```

## Results

- ✅ Makefile syntax validates
- ✅ Dry-run mode works
- ✅ VERBOSE mode shows API endpoints
- ✅ DEBUG mode shows parameters

## PR

- **PR**: #7
- **URL**: https://github.com/tbrandenburg/ghaw/pull/7
- **Status**: Open

## Completed

- 2026-03-08
