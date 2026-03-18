# homebrew-axonhub

Official Homebrew tap for [AxonHub](https://github.com/looplj/axonhub).

## Install

```bash
brew tap looplj/axonhub
brew install axonhub
axonhub version
```

This tap supports both macOS and Linux Homebrew environments.

## Run as a service

Use Homebrew services to run AxonHub in the background:

```bash
brew services start axonhub
brew services stop axonhub
brew services restart axonhub
```

## Configuration

The formula installs:

- the `axonhub` binary
- the configuration directory at `$(brew --prefix)/etc/axonhub`
- a wrapper script that starts AxonHub from the Homebrew configuration directory so `config.yml` is loaded automatically when present

Homebrew creates the configuration directory, but it does **not** create `config.yml` for you.

For the complete configuration reference and all supported settings, see the main project documentation:

- [AxonHub deployment configuration](https://github.com/looplj/axonhub/blob/main/docs/en/deployment/configuration.md)

If you need custom configuration, create `config.yml` before starting the service:

```bash
mkdir -p "$(brew --prefix)/etc/axonhub"
cat > "$(brew --prefix)/etc/axonhub/config.yml" <<'EOF'
server:
  port: 8090

db:
  dialect: "sqlite3"
  dsn: "file:axonhub.db?cache=shared&_fk=1"
EOF
```

Common config file locations:

- Apple Silicon macOS: `/opt/homebrew/etc/axonhub/config.yml`
- Intel macOS: `/usr/local/etc/axonhub/config.yml`
- Linux Homebrew: `$(brew --prefix)/etc/axonhub/config.yml`

## Formula

The formula is defined in [`Formula/axonhub.rb`](Formula/axonhub.rb).

It installs release archives published by the main repository, supports macOS and Linux artifacts, and verifies the installation with:

```bash
axonhub version
```
