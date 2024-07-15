#!/bin/sh

VM_NAME="Windows"

vm_state=$(virsh --connect qemu:///system domstate "$VM_NAME")

if [ "$vm_state" != "running" ]; then
  virsh --connect qemu:///system start "$VM_NAME"
  sleep 5
fi

xfreerdp -grab-keyboard /v:192.168.122.93 /u:joy /p:1 /size:100% /dynamic-resolution /gfx-h264:avc444 +gfx-progressive /sec:nla /bpp:32 /rfx /rfx-mode:video -bitmap-cache -offscreen-cache -glyph-cache
