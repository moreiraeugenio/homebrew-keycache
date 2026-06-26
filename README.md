# homebrew-keycache

Homebrew tap for [Keycache](https://github.com/moreiraeugenio/keycache) — key-value notes in your menu bar.

## Install

```bash
brew install --cask moreiraeugenio/keycache/keycache
```

Or, equivalently:

```bash
brew tap moreiraeugenio/keycache
brew install --cask keycache
```

## Upgrade

```bash
brew upgrade
```

## Uninstall

```bash
brew uninstall --cask keycache
brew untap moreiraeugenio/keycache
```

## How updates land here

After every tagged release on [`moreiraeugenio/keycache`](https://github.com/moreiraeugenio/keycache), the `homebrew-bump` job in that repo's release workflow opens a PR here bumping `Casks/keycache.rb` to the new version + per-arch `sha256`. Merging that PR ships the update to `brew upgrade` users.

## Notes

- Keycache is currently distributed **unsigned**. macOS will show a Gatekeeper warning on first launch; right-click the app → **Open** to bypass. See the [Unsigned caveat](https://github.com/moreiraeugenio/keycache#unsigned-caveat) section in the main README.
- Apple Silicon (`arm64`) and Intel (`x64`) builds are both supported from v0.3.1 onward. v0.3.0 ships arm64 only.
