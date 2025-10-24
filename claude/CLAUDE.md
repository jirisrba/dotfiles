# Global Git Commit Guidelines

## Commit Message Format

Always use **one-line commit messages** without multi-line descriptions or bodies.

**Pattern:** `{type}({ticket}): {concise description}`

### Examples

✅ **Good - single line:**
```
fix(TRIVIAL): correct typo in mongodb_roles variable name
feat(INFRA-1234): add MongoDB autoscaling configuration
chore(TRIVIAL): update dependencies
```

❌ **Bad - multi-line with body:**
```
fix(TRIVIAL): correct typo in mongodb_roles variable name

Fixed typo from 'monogodb_roles' to 'mongodb_roles' across all environments.
```

### Components

- **type**: `feat`, `fix`, `chore`, `refactor`, `docs`, `test`, `perf`, etc.
- **ticket**: JIRA ticket number (e.g., `INFRA-1234`) or `TRIVIAL` for minor changes
- **description**: Short, clear description (50-72 characters recommended)

### Additional Rules

- Do NOT include multi-line bodies
- Do NOT include "Co-Authored-By: Claude" attribution in commits
- Keep the entire message concise and meaningful
- Focus on WHAT changed, not WHY (the code diff shows the details)

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
