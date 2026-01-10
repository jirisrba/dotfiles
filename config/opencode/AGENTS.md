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
