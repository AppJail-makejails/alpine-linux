# Alpine Linux

Alpine Linux is a Linux distribution designed to be small, simple and secure. Alpine Linux uses musl, BusyBox and OpenRC instead of the more commonly used glibc, GNU Core Utilities and systemd respectively.

wikipedia.org/wiki/Alpine_Linux

![alpine linux logo](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Alpine_Linux.svg/250px-Alpine_Linux.svg.png)

## How to use this Makejail

```
INCLUDE options/network.makejail
INCLUDE gh+Appjail-makejails/alpine-linux

ARG ruleset=0

OPTION template=files/linux.conf
OPTION devfs_ruleset=${ruleset}
```

Where `options/network.makejail` are the options that suit your environment, for example:

```
ARG network
ARG interface=appjail0

OPTION alias=${interface}
OPTION virtualnet=${network} default
OPTION nat
```

In the above example `appjail0` is a loopback interface, so it must first exist before creating the jail.

The `files/linux.conf` template is as follows:

```
exec.start: /bin/true
exec.stop: /bin/true
persist
```

Alpine Linux is a generic jail, so AppJail does not know which modules to use, so we need to manually load them before creating the jail.

```sh
kldload linux linux64 fdescfs tmpfs linprocfs linsysfs pty
```

Use `loader.conf(5)` to load them at startup.

Open a shell and run `appjail makejail`:

```sh
appjail makejail -j alpine -- --network development --ruleset 11
```

Your ruleset must unhide `shm` and `shm/*`.

After Makejail builds the jail, you can run Alpine Linux using the `alpine_shell` custom stage:

```sh
appjail run -s alpine_shell alpine
```

### Arguments

* `alpine_linux_major` (default: `3`).
* `alpine_linux_minor` (default: `17`).
* `alpine_linux_patch_level` (default: `3`).
* `alpine_linux_arch` (default: `x86_64`).
