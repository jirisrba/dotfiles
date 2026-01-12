# Dotfiles Repository - Agent Guidelines

This is a personal dotfiles repository for macOS shell configuration and development tools.

## Repository Overview

**Type:** Shell configuration (Zsh, Git, Kubernetes, AWS, Docker)
**Language:** Shell scripts (Bash/Zsh)
**Platform:** macOS (Darwin)
**Purpose:** Personal development environment configuration

## Key Files

- `.zshrc` - Zsh configuration with oh-my-zsh plugins
- `aliases` - Custom command aliases (git, kubectl, docker, AWS, AI tools)
- `functions` - Shell functions (git workflows, terraform, kubectl helpers)
- `.gitconfig` - Git global configuration
- `config/starship.toml` - Starship prompt configuration
- `config/opencode/AGENTS.md` - OpenCode agent guidelines
- `claude/CLAUDE.md` - Claude Code agent guidelines
- `copilot/copilot-instructions.md` - GitHub Copilot instructions

## Testing & Validation

**No formal test suite** - this is a configuration repository

### Manual Testing
```bash
# Test zsh configuration
source ~/.zshrc

# Validate shell syntax
zsh -n .zshrc
bash -n functions
bash -n aliases

# Test specific function
source functions
type gac  # Should show function definition

# Test alias
source aliases
alias k   # Should show kubectl alias
```

### Validation Commands
```bash
# Check for syntax errors in all shell files
for file in .zshrc aliases functions; do
  echo "Checking $file..."
  zsh -n "$file" 2>&1 || bash -n "$file" 2>&1
done
```

## Git Commit Guidelines

**CRITICAL:** Always follow semantic commit format without multi-line bodies.

### Commit Format
```
{type}({scope}): {concise description}
```

### Commit Types
- `feat` - New feature or configuration
- `fix` - Bug fix
- `chore` - Maintenance, dependency updates
- `refactor` - Code/config restructuring
- `docs` - Documentation changes
- `style` - Formatting changes
- `perf` - Performance improvements

### Rules
- ✅ One-line commits only (50-72 characters)
- ✅ Lowercase type and scope
- ✅ Imperative mood ("add" not "added")
- ❌ NO multi-line bodies
- ❌ NO "Co-Authored-By: Claude" attributions
- ❌ NO JIRA ticket IDs (this is personal repo)

### Examples
```bash
# Good
feat(zsh): add web-search plugin to oh-my-zsh
fix(aliases): correct kubectl colorization flags
refactor(git): reorganize AI tool aliases
chore(deps): update oh-my-zsh plugins

# Bad
feat: add feature

Added a new feature to the configuration.
This includes multiple changes across files.
```

## Code Style & Conventions

### Shell Script Style

**File Headers**
```bash
#!/usr/bin/env bash
# or
#!/usr/bin/env zsh
```

**Function Naming**
- Lowercase with underscores: `my_function()`
- Or camelCase for Git shortcuts: `gac()`, `gcf()`
- Descriptive names: `kdecode()` not `kd()`

**Variable Naming**
```bash
# Local variables - lowercase
local my_var="value"

# Environment variables - UPPERCASE
export MY_ENV_VAR="value"

# Use double quotes for variables
echo "$my_var"
```

**Conditionals**
```bash
# Use [[ ]] for conditionals
if [[ -z "$1" ]]; then
  echo "Error: argument required"
  return 1
fi

# Check command existence
if command -v kubectl &> /dev/null; then
  # Do something
fi
```

**Error Handling**
```bash
# Always check for errors
if [[ -z "$*" ]]; then
  echo "Error: Commit message required"
  return 1
fi

# Use || for error fallback
git push || echo "Warning: push failed, continuing..."
```

**Comments**
```bash
# Single line comments for clarity
# Explain WHY, not WHAT

# Good
# Backup drafts before system update to prevent data loss
7z a ~/drafts.$(date).7z ~/drafts

# Bad
# Create archive
7z a ~/drafts.$(date).7z ~/drafts
```

### Alias Conventions

**Format:** `alias name='command'`

**Categories** (organize with comments):
```bash
# git alias
alias g='git'
alias gl="git log --graph..."

# kubectl aliases
alias k='kubecolor --force-colors'
alias kg='kubecolor --force-colors get'
```

**Global Aliases** (Zsh only):
```bash
alias -g OY="--output yaml"
alias -g LL=' |& less -R'
```

### Oh-My-Zsh Plugin Management

**Plugin List Location:** `.zshrc` lines 62-90

**Adding Plugins:**
1. Add to plugins array in alphabetical order (preferred)
2. Ensure plugin exists: `ls ~/.oh-my-zsh/plugins/`
3. Test after adding: `source ~/.zshrc`

**Removing Plugins:**
1. Remove from plugins array
2. Clean restart: `exec zsh`

## File Organization

**Configuration Files:** Root directory
**Nested Configs:** `config/`, `ssh/`, `aws/`, `claude/`, `copilot/`
**Temporary Files:** Always use `/tmp/` for test/debug scripts
**Platform-Specific:** `windows/` directory for Windows configs

## Path References

**Use absolute paths with $HOME:**
```bash
source "$HOME/dotfiles/aliases"
[[ -f "$HOME/dotfiles/functions" ]] && source "$HOME/dotfiles/functions"
```

**Git repo location:** `/Users/jirisrba/dotfiles`
**Default branch:** `main`

## Special Considerations

### AI Tool Aliases
Located in `aliases` file (lines 90-101):
- Claude Code: `cc`, `cc-quick`, `cc-continue`
- GitHub Copilot: `cop`
- OpenCode: `oc`, `occ`

### Kubernetes Aliases
Heavy use of `kubecolor` with `--force-colors` flag for better terminal output

### Git Functions
- `gac()` - Git add, commit, push in one command
- `gcf()` - Git commit fixup with autosquash
- `ghprc()` - Create GitHub PR with smart title/body

## Best Practices

1. **Always test changes:** Source files after editing
2. **Use existing patterns:** Follow established alias/function styles
3. **Document complex logic:** Add comments for non-obvious code
4. **Check dependencies:** Verify commands exist before using
5. **Handle errors gracefully:** Use fallbacks and warnings
6. **Keep it portable:** Avoid hardcoded paths (use $HOME)
7. **Organize logically:** Group related aliases/functions together

## Common Operations

```bash
# Reload configuration
source ~/.zshrc

# Edit configuration
code ~/dotfiles/.zshrc

# Apply git changes
cd ~/dotfiles
git add -A
git commit -m "feat(zsh): add new plugin"
git push
```
