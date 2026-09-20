# Ratchetry Homebrew tap

This is the official Homebrew tap for
[Ratchetry](https://github.com/brunoribeirol/ratchery), a security-first,
cost-aware workspace for Claude Code and Codex.

## Install

Install the fully qualified formula directly. Homebrew will add the tap and
trust only this formula:

```bash
brew install brunoribeirol/tap/ratchery
```

The package installation is intentionally non-interactive and does not write
agent configuration into your home directory. Configure your workspace
explicitly afterward:

```bash
ratchery setup --projects-root "$HOME/Projects" --yes
ratchery doctor-global --deep
```

Obsidian memory remains optional:

```bash
ratchery setup \
  --vault "$HOME/Documents/Obsidian Vault" \
  --projects-root "$HOME/Projects" \
  --yes
```

Then initialize a repository:

```bash
cd /path/to/repository
ratchery init
ratchery tier-set
ratchery doctor --deep
```

## Upgrade

```bash
brew update
brew upgrade ratchery
ratchery setup --yes
```

`setup` is idempotent and preserves the existing Vault choice when no
`--vault` or `--no-vault` flag is supplied.

## Integrity and support

The formula pins an immutable Ratchetry release archive and its SHA-256.
Ratchetry also publishes checksums, an SPDX SBOM, and GitHub artifact
attestations with each stable release.

- General issues: <https://github.com/brunoribeirol/ratchery/issues>
- Security reports: <https://github.com/brunoribeirol/ratchery/security/advisories/new>
- Release verification: <https://github.com/brunoribeirol/ratchery/blob/main/docs/PUBLISHING.md>

## Contributing

Formula changes must use a pull request and pass the macOS and Linux Homebrew
jobs. See [CONTRIBUTING.md](CONTRIBUTING.md).
