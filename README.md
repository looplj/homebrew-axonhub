# homebrew-axonhub

Homebrew tap for [AxonHub](https://github.com/looplj/axonhub).

## Install

```bash
brew tap looplj/axonhub
brew install axonhub
axonhub version
```

The formula supports both macOS and Linux Homebrew environments.

## Service management

```bash
brew services start axonhub
brew services stop axonhub
brew services restart axonhub
```

## What gets installed

- `axonhub` binary
- Default config at `$(brew --prefix)/etc/axonhub/config.yml`
- A wrapper script that starts AxonHub from the Homebrew config directory so the default config is discovered automatically

If you want to customize the configuration, edit:

- Apple Silicon macOS: `/opt/homebrew/etc/axonhub/config.yml`
- Intel macOS: `/usr/local/etc/axonhub/config.yml`
- Linux Homebrew: `$(brew --prefix)/etc/axonhub/config.yml`

## Formula

The formula lives at [`Formula/axonhub.rb`](Formula/axonhub.rb).

It installs the release archive published by the main repository, supports macOS and Linux release artifacts, and verifies the installation with:

```bash
axonhub version
```
