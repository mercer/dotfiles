#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Add Vagrant's NFS setup commands to sudoers, for `vagrant up` without a password
# on Mac OS

# it doesn't seem to work

# Stage updated sudoers in a temporary file for syntax checking
TMP=$(mktemp -t vagrant_sudoers.XXXX)
cat /etc/sudoers > $TMP
cat >> $TMP <<EOF
# Allow passwordless startup of Vagrant when using NFS.
# https://gist.github.com/joemaller/6764700
Cmnd_Alias VAGRANT_EXPORTS_ADD = /bin/bash -c echo '*' >> /etc/exports
Cmnd_Alias VAGRANT_NFSD = /sbin/nfsd restart
Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /usr/bin/sed -E -e /*/ d -ibak /etc/exports
%staff ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE
EOF

# Check syntax and overwrite sudoers if clean
visudo -c -f $TMP
if [ $? -eq 0 ]; then
  echo "Adding vagrant commands to sudoers"
  cat $TMP > /etc/sudoers
else
  echo "sudoers syntax wasn't valid. Aborting!"
fi

rm -f $TMP
