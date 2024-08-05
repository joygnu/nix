#!/bin/sh

VM_NAME="Windows"

vm_state=$(virsh --connect qemu:///system domstate "$VM_NAME")

if [ "$vm_state" != "running" ]; then
  virsh --connect qemu:///system start "$VM_NAME"
  sleep 15
fi

# Get the IP address of the VM
VM_IP=$(virsh --connect qemu:///system domifaddr "$VM_NAME" | grep -oP '(\d+\.){3}\d+' | head -1)

if [ -z "$VM_IP" ]; then
  echo "Failed to retrieve IP address for VM: $VM_NAME"
  exit 1
fi

xfreerdp -grab-keyboard /v:"$VM_IP" /u:joy /p:1 /size:100% /dynamic-resolution /gfx-h264:avc444 +gfx-progressive /sec:nla /bpp:32 /rfx /rfx-mode:video -bitmap-cache -offscreen-cache -glyph-cache
