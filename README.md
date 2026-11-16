# Coucou overlay

This overlay contains an experimental `gui-apps/coucou` 0.5.9 ebuild. The
frontend and hook relay have been built offline, but the complete ebuild and
application have not yet been verified in a suitable Gentoo build environment.

The source is [Coucou](https://github.com/Louis-CFM/coucou) at commit
`74363634b037108393e450428e5f207515c2c29b` (Linux release `linux-v0.5.9`).
The ebuild uses the upstream Cargo and npm lockfiles and preserves the Cargo
release optimizations, including LTO. Gentoo manages stripping and debug
symbols. Portage fetches the locked crates and npm tarballs before the build.
npm installs from a local cache with lifecycle scripts disabled.

The ebuild also fetches the official `sherpa-onnx` 1.13.8 static library
archive and supplies its libraries locally to `sherpa-onnx-sys`. This archive
contains prebuilt native libraries, including eSpeak NG; eSpeak NG is licensed
under GPL-3.0-or-later. The complete third-party license inventory of the native
archive still needs verification. Upstream tests are restricted because some
start local network services.

Coucou's source code is MIT licensed, but its name, character, icons, sounds
and other artwork have separate terms. See [the upstream asset license](licenses/coucou-assets).
Those terms allow building and running Coucou from the repository for personal
use and restrict distribution. Do not publish binaries, bundled application
archives or modified artwork from this overlay.
