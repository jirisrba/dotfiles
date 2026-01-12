# Global Git Commit Guidelines

## Commit Message Format

Always use **semantic commit messages** in one-line format without multi-line descriptions or bodies.

**Pattern:** `{type}({scope}): {concise description}`

The `scope` is optional but recommended for better context.

### Examples

✅ **Good - semantic commits:**

```
feat(auth): add OAuth2 authentication support
fix(api): resolve timeout issue in user endpoint
chore(deps): update dependencies to latest versions
refactor(database): simplify query builder logic
docs(readme): update installation instructions
test(user): add unit tests for user service
perf(cache): implement Redis caching layer
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
