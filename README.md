# djo-shell

A series of shell scripts that I use in various things.  Installable using NPM:

[![NPM](https://nodei.co/npm/djo-shell.png)](https://nodei.co/npm/djo-shell/)

## Usage

After installing using npm, you should be able to run the following commands:

### `browser-version <browser> <version>`

Get pipe (`|`) separated details of the target browser version you are interested in for linux_x64:

```sh
browser-version chrome stable

# download the deb file for a version
wget `browser-version chrome stable | cut -d'|' -f4`

# or, just echo the version of chrome beta
browser-version chrome beta | cut -d'|' -f3
```

### `browser-list`

Use [`parallel`](http://www.gnu.org/software/parallel/) to retrieve some well known combinations of the browsers (in parallel):

```sh
browser-list
```

Which would generate output similar to the following:

```
firefox|stable|36.0.4|http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/latest/linux-x86_64/en-US/firefox-36.0.4.tar.bz2
chrome|beta|42.0.2311.60|https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb
chrome|unstable|43.0.2334.0|https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb
chrome|stable|41.0.2272.101|https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
firefox|beta|37.0b7|http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/latest-beta/linux-x86_64/en-US/firefox-37.0b7.tar.bz2
firefox|unstable|39.0a1|http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/firefox-39.0a1.en-US.linux-x86_64.tar.bz2
```


## LICENSE

### ISC

Copyright (c) 2015, Damon Oehlman <damon.oehlman@gmail.com>

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.