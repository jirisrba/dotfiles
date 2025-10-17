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
