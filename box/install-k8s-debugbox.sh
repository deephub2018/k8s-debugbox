#!/tmp/box/busybox sh

if [ ! -e /tmp/box/bin/sh ]; then
  mkdir -p /tmp/box/bin

  if [ ! -e /tmp/box/busybox ]; then
    cp /usr/local/k8s-debugbox/box/* /tmp/box
  fi

  echo "Installing Busybox"
  /tmp/box/busybox --install /tmp/box/bin

  echo "Installing toybox"
  for i in $(/tmp/box/toybox); do [ -e /tmp/box/bin/$i ] || ln /tmp/box/toybox /tmp/box/bin/$i; done

  echo "Installing curl"
  [ -e /tmp/box/bin/curl ] || ln /tmp/box/curl /tmp/box/bin/curl

  [ -e /tmp/box/sh ] || cp /box/sh /tmp/box/sh
  chmod 0755 /tmp/box/sh
fi
