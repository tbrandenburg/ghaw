# Stale PR and Issue Check

You are tasked with checking for stale pull requests and issues in this repository and commenting on them to notify the repository owner.

## Your Tasks:

1. **Get repo owner github user name**
   - Use gh CLI to get the repo owner github user name: `gh repo view --json owner --jq '.owner.login'`

2. **Check for stale pull requests:**
   - Find PRs that have been open for more than 14 days without any activity (no comments, commits, or updates)
   - Ignore PRs that are marked as drafts or have "WIP" in the title
   - For each stale PR found, add a comment mentioning @[REPO-OWNER] (the repository owner)

3. **Check for stale issues:**
   - Find issues that have been open for more than 30 days without any activity (no comments or updates)
   - Ignore issues that have labels like "enhancement", "long-term", "backlog", or "wontfix"
   - For each stale issue found, add a comment mentioning @[REPO-OWNER] (the repository owner)

## Comment Templates:

For stale PRs, use this template:
```
🕰️ This pull request has been inactive for over 14 days. 

@[REPO-OWNER] - Could you please review this PR or provide an update on its status?

If this PR is no longer needed, please consider closing it to keep the repository clean.
```

For stale issues, use this template:
```
🕰️ This issue has been inactive for over 30 days.

@[REPO-OWNER] - Could you please provide an update on this issue?

If this issue is resolved or no longer relevant, please consider closing it.
```

## Guidelines:

- Only comment once per stale item (check if you've already commented before)
- Be polite and professional in all communications
- Use the GitHub CLI (`gh`) or GitHub API to interact with the repository
- Provide a summary of your actions at the end

## Expected Output:

Provide a summary report showing:
- Number of stale PRs found and commented on
- Number of stale issues found and commented on
- Any errors encountered during the process