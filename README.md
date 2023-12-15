# Alpine Linux

Alpine Linux is a Linux distribution designed to be small, simple and secure. Alpine Linux uses musl, BusyBox and OpenRC instead of the more commonly used glibc, GNU Core Utilities and systemd respectively.

wikipedia.org/wiki/Alpine\_Linux

![alpine linux logo](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Alpine_Linux.svg/250px-Alpine_Linux.svg.png)

## How to use this Makejail

Alpine Linux is a generic jail, so AppJail does not know which modules to use, so we need to manually load them before creating the jail.

```sh
kldload linux linux64 fdescfs tmpfs linprocfs linsysfs pty
```

**Note**: Use `loader.conf(5)` to load them at startup.

Open a shell and run `appjail makejail`:

```sh
appjail makejail -j alpine -f gh+AppJail-makejails/alpine-linux \
    -o template=/usr/local/share/examples/appjail/templates/linux.conf \
    -o alias \
    -o virtualnet=":appjail0 default" \
    -o nat
```

**Tip**: Read [Alias & Virtual Networks](https://appjail.readthedocs.io/en/latest/networking/virtual-networks/alias-and-virtual-networks/) to see how to create the `appjail0` interface.

After Makejail builds the jail, you can run Alpine Linux using the `alpine_shell` custom stage:

```sh
appjail run -s alpine_shell alpine
```

### Arguments

* `alpine_linux_tag` (default: `3.19.0-x86_64`): see [#tags](#tags).

## Tags

| Tag             | Arch    | Type      | `alpine_linux_major` | `alpine_linux_minor` | `alpine_linux_patch_level` | `alpine_linux_arch` |
| --------------- | ------- | --------- | -------------------- | -------------------- | -------------------------- | ------------------- |
| `3.19.0-x86_64` | `amd64` | `generic` |         `3`          |         `18`         |             `5`            |       `x86\_64`     |
