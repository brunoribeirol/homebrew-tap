# Contributing

This repository packages Ratchetry for Homebrew. Product changes belong in the
[main repository](https://github.com/brunoribeirol/ratchery).

For a formula update:

1. Reference a published stable Ratchetry release asset.
2. Copy its exact SHA-256 from the verified `SHA256SUMS.txt` asset.
3. Keep installation non-interactive; user configuration belongs to
   `ratchery setup`.
4. Run `brew audit --strict --online`, `brew style`, a source install, and
   `brew test`.
5. Open a focused pull request. Do not move or reuse a published version.

Do not add lifecycle scripts, network calls during `test do`, or write to the
real user's home directory.
