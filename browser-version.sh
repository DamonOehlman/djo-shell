#!/usr/bin/env bash
BASE_FIREFOX=ftp.mozilla.org/pub/mozilla.org/firefox
BASE_FIREFOX_NIGHTLY=$BASE_FIREFOX/nightly/latest-trunk
BASE_FIREFOX_RELEASE=$BASE_FIREFOX/releases
BASE_FIREFOX_STABLE=$BASE_FIREFOX_RELEASE/latest/linux-x86_64/en-US
BASE_FIREFOX_BETA=$BASE_FIREFOX_RELEASE/latest-beta/linux-x86_64/en-US

extractFirefoxVersion() {
  echo $1 | sed -r "s/^.*firefox-([0-9\.ba]+)\..*tar.bz2$/\1/"
}

getChromeVersion() {
  case $1 in
    unstable)
      VERSION=`curl -s http://omahaproxy.appspot.com/all | grep ^linux\,dev | cut -d',' -f3`
      ;;
    *)
      VERSION=`curl -s http://omahaproxy.appspot.com/all | grep ^linux\,$1 | cut -d',' -f3`
      ;;
  esac
  
  echo "chrome $1 $VERSION https://dl.google.com/linux/direct/google-chrome-$1_current_amd64.deb"
}

getFirefoxVersion() {
  case $1 in
    stable)
      TARGET=http://$BASE_FIREFOX_STABLE/`curl -s --list-only ftp://$BASE_FIREFOX_STABLE/`
      ;;
    beta)
      TARGET=http://$BASE_FIREFOX_BETA/`curl -s --list-only ftp://$BASE_FIREFOX_BETA/`
      ;;
    unstable)
      TARGET=http://$BASE_FIREFOX_NIGHTLY/`curl -s --list-only ftp://$BASE_FIREFOX_NIGHTLY/ | grep -e en-US\.linux-x86_64\.tar\.bz2`
      ;;
  esac

  echo "firefox $1 $(extractFirefoxVersion $TARGET) $TARGET"
}

case $1 in
  chrome)
    getChromeVersion $2
    ;;
  
  firefox)
    getFirefoxVersion $2
    ;;
esac