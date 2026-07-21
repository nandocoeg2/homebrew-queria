# homebrew-queria

Homebrew **tap** for [queria-cli](https://github.com/nandocoeg2/queria-backend) (laptop `index-here`).

| Install | Command |
|---|---|
| Tap + formula | `brew tap nandocoeg2/queria` then `brew install queria-cli` |
| One shot | `brew install nandocoeg2/queria/queria-cli` |

This directory is the GitHub repo **`nandocoeg2/homebrew-queria`** (Homebrew maps `user/homebrew-FOO` → tap `user/FOO`).

## Status: scaffold / not installable yet

> **`Formula/queria-cli.rb` is a PLACEHOLDER.** It calls Homebrew `odie` on every platform so `brew install` fails loudly until a real formula is generated.
>
> Do **not** tell users `brew install` works until:
> 1. A `cli-v*` Release on `queria-backend` has downloadable archives, and  
> 2. `generate_homebrew_formula.sh` has rewritten `Formula/queria-cli.rb` with real `url` + `sha256`, and  
> 3. That formula is committed and pushed to this repo’s `main`.

Formula `version` is plain semver (`0.1.0`), **not** the git tag prefix (`cli-v0.1.0`). The generator strips `cli-v` via `${TAG#cli-v}`.

## Private GitHub Releases

Binary assets live on **`queria-backend`** releases (`cli-v*` tags). If that repo (or the Release) is **private**, set a token **before** install:

```bash
export HOMEBREW_GITHUB_API_TOKEN='ghp_…'   # Contents read on queria-backend
brew install nandocoeg2/queria/queria-cli
```

Without a token, Homebrew cannot download private release assets.

## One-time: publish this tap

```bash
cd queria/homebrew-queria   # sibling of queria/backend in the workspace
git init   # if not already a repo
git add README.md Formula .gitignore
git commit -m "chore: initial queria-cli homebrew tap scaffold"
# create empty repo nandocoeg2/homebrew-queria on GitHub, then:
git branch -M main
git remote add origin git@github.com:nandocoeg2/homebrew-queria.git
git push -u origin main
```

Do **not** force-create the remote without credentials. Do **not** treat this as part of the `queria-backend` git remote long-term.

## Maintainers (after every CLI release)

1. Ship CLI: on `queria-backend`, tag `cli-vX.Y.Z` → workflow **Release queria-cli** must be green with assets:
   - required: `queria-cli-aarch64-apple-darwin.tar.gz`
   - required: `queria-cli-x86_64-apple-darwin.tar.gz`
   - required: `queria-cli-x86_64-unknown-linux-gnu.tar.gz`
   - optional: `queria-cli-aarch64-unknown-linux-gnu.tar.gz` (formula `odie` on Linux arm if missing)
2. Generate formula (from `queria-backend`):

   ```bash
   # private assets — script token precedence:
   #   GH_TOKEN → GITHUB_TOKEN → HOMEBREW_GITHUB_API_TOKEN
   export GH_TOKEN='ghp_…'   # or GITHUB_TOKEN / HOMEBREW_GITHUB_API_TOKEN

   ./scripts/generate_homebrew_formula.sh cli-v0.1.0
   # default writes: ../homebrew-queria/Formula/queria-cli.rb
   # custom path:
   # ./scripts/generate_homebrew_formula.sh cli-v0.1.0 --out /path/to/queria-cli.rb
   ```

   The script **only** hashes real HTTP 200 downloads. It **refuses to write** invented or partial sha256 values. Tag must match `cli-v*`; formula `version` becomes `0.1.0` (no `cli-v` prefix).

3. Commit + push **this** repo (`main`):

   ```bash
   cd ../homebrew-queria   # or your clone of nandocoeg2/homebrew-queria
   git add Formula/queria-cli.rb
   git commit -m "queria-cli 0.1.0"
   git push origin main
   ```

4. Users:

   ```bash
   # private Release assets at install time:
   # export HOMEBREW_GITHUB_API_TOKEN=…
   brew update && brew upgrade queria-cli   # or reinstall / first install
   queria-cli index-here --help
   ```

**Not** published by push to `queria-backend` `main`. Only after CLI Release assets exist and this formula is updated.

## User install (when formula SHAs are real)

```bash
brew install nandocoeg2/queria/queria-cli
# private: export HOMEBREW_GITHUB_API_TOKEN=… first
queria-cli index-here --help
```

## See also

- `queria-backend` operator runbook: `docs/runbooks/queria-cli-homebrew.md`
- Release checklist: `docs/runbooks/deployment.md`
- User install overview: `docs/runbooks/onboarding.md` § Install `queria-cli`
- Generator: `scripts/generate_homebrew_formula.sh`
