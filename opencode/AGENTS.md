# Global Git Commit Guidelines

## Commit Message Format

Always use **semantic commit messages** in one-line format without multi-line descriptions or bodies.

**Pattern:** `{type}: {JIRA-ID} {concise description}`

Alternatively, you can use a scope in parentheses: `{type}({scope}): {JIRA-ID} {concise description}`

The JIRA task ID should be separated from the description by a space. The scope is optional.

### Examples

✅ **Good - semantic commits:**

```
feat: DVS-1234 add OAuth2 authentication support
fix: DVS-5678 resolve timeout issue in user endpoint
chore: DVS-9012 update dependencies to latest versions
refactor: DVS-3456 simplify query builder logic
docs: DVS-7890 update installation instructions
test: DVS-2345 add unit tests for user service
perf: DVS-6789 implement Redis caching layer
```

**With optional scope:**

```
feat(auth): DVS-1234 add OAuth2 authentication support
fix(api): DVS-5678 resolve timeout issue in user endpoint
chore(deps): DVS-9012 update dependencies to latest versions
```

❌ **Bad - non-semantic:**

```
Fixed typo from 'monogodb_roles' to 'mongodb_roles' across all environments.
Updated some files
bug fix
```

### Commit Types

- **feat**: New feature
- **fix**: Bug fix
- **chore**: Routine tasks, maintenance, dependency updates
- **refactor**: Code restructuring without changing functionality
- **docs**: Documentation changes
- **test**: Adding or updating tests
- **perf**: Performance improvements
- **style**: Code style/formatting changes
- **ci**: CI/CD configuration changes
- **build**: Build system or external dependency changes

### Additional Rules

- Do NOT include multi-line bodies
- Do NOT include "Co-Authored-By: Claude" attribution in commits
- Use lowercase for type and scope
- Keep the entire message concise and meaningful (50-72 characters recommended)
- Use imperative mood ("add" not "added", "fix" not "fixed")
- Focus on WHAT changed, not WHY (the code diff shows the details)

## Git Branch Naming Guidelines

When creating new branches, always follow this naming convention to include JIRA task IDs:

**Pattern:** `{type}/{JIRA-ID}-{brief-description}`

### Branch Types

- **feat/** - New features
- **fix/** - Bug fixes
- **chore/** - Maintenance tasks
- **refactor/** - Code refactoring
- **docs/** - Documentation updates
- **test/** - Test additions or updates
- **hotfix/** - Urgent production fixes

### Examples

✅ **Good - with JIRA IDs:**

```
feat/DVS-4404-multiarch-build
feat/DVS-1234-oauth2-authentication
fix/DVS-5678-api-timeout-issue
chore/DVS-9012-update-dependencies
refactor/DVS-3456-simplify-query-builder
```

❌ **Bad - without JIRA IDs:**

```
feature-branch
fix-bug
my-changes
update-code
```

### Rules

- Always include the JIRA task ID after the type prefix
- Use kebab-case for the description (lowercase with hyphens)
- Keep descriptions brief but meaningful (2-5 words)
- Extract JIRA ID from the current branch name when working in an existing repository
- Before creating a new branch, check if there's an active JIRA task associated with the work

## GitLab Merge Request Guidelines

When creating merge requests for GitLab repositories, use the **glab** CLI utility.

### Creating a Merge Request

Use the following command to create a merge request:

```bash
glab mr create --title "commit message" --description "$(cat <<'EOF'
## Summary

Brief summary of changes

## Changes

- Bullet point list of changes
- Include specific details

## Related

- JIRA: TASK-ID
- Additional context
EOF
)" --yes
```

### Rules

- The title should match the commit message format: `{type}: {JIRA-ID} {description}`
- Use a heredoc for multi-line descriptions with markdown formatting
- Include sections: Summary, Changes, and Related
- Reference the JIRA task ID in the Related section
- Use `--yes` flag to skip confirmation prompts

### Example

```bash
glab mr create --title "chore: DVS-5337 rename aux directories to auxiliary" --description "$(cat <<'EOF'
## Summary

Renamed all `aux` directories to `auxiliary` to fix Windows compatibility.

## Changes

- Renamed 4 `aux` directories across the database structure
- Total: 46 SQL view files moved

## Related

- JIRA: DVS-5337
EOF
)" --yes
```

## File Creation Guidelines

### Temporary and Testing Files

Always create temporary, testing, and supporting scripts in `/tmp/` unless explicitly instructed otherwise:

- Test scripts
- Validation scripts
- Debug scripts
- One-off automation scripts
- Any files not meant to be committed to the repository

**Examples:**

- Testing API endpoints: `/tmp/test_api.sh`
- Validating configuration: `/tmp/validate_config.py`
- Debug output: `/tmp/debug_output.txt`

**Exception:** Only create files in the project directory when they are:

- Part of the permanent codebase
- Required for CI/CD pipelines
- Configuration files to be version-controlled
