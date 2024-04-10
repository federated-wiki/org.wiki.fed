# Flatpak manifest for Federated Wiki

Another way of distributing Federated Wiki. This time with Flatpak.

## Prerequisites

- flatpak-builder
- A local Node.JS instance is used to generate a `package-lock.json` from the distributed Wiki tarball found on NPM
- You will need to clone and install [flatpak-node-generator](https://github.com/flatpak/flatpak-builder-tools/tree/master/node) to generate `generated-sources.json`

## Prepare

We need to prepopulate the NPM cache with distribution artifacts from all dependencies named in `package.json`.

```sh
bin/prepare.sh
```

## Build and install

Build the application into `build-dir` with using the `org.wiki.fed.yaml` manifest.

Choose to `--install` to the current `--user` and `--force-clean` the build area.

```sh
flatpak-builder --user --install --force-clean build-dir org.wiki.fed.yaml
```

## Optional: prepare configuration

To get started quickly, you can prepare a simple configuration for your wiki.

```sh
 cat <<<"{                   
  "security_type": "friends",
  "cookieSecret": "$(pwgen -n 64 1 | sed -z "s/\n//g")",
  "session_duration": 365
}
" > $HOME/.wiki/config.json
```

## Run

Just run it!

```sh
flatpak run org.wiki.fed
```

Your local wiki is now available at http://localhost:3000

## Clean

Clean all generated files with:

```sh
bin/clean.sh
```
