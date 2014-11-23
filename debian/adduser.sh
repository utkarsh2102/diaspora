#!/bin/sh

# add diaspora system user (requires adduser >= 3.34)
# don't muck around with this unless you KNOW what you're doing
user=diaspora

echo "Creating/updating $user user account..."
adduser --system --home /usr/share/$user \
	--gecos "$user system user" --shell /bin/false \
	--quiet --disabled-password $user || {
  # adduser failed. Why?
  if [ `getent passwd $user|awk -F ':' '{print $3}'` -gt 999 ] >/dev/null ; then
	echo "Non-system user $user found. I will not overwrite a non-system" >&2
	echo "user.  Remove the user and reinstall diaspora." >&2
	exit 1
  fi
  # unknown adduser error, simply exit
  exit 1
  }
