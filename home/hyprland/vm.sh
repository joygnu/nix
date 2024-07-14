#!/bin/sh

# Start the virtual machine named "Windows" using virsh
virsh --connect qemu:///system start Windows

# Wait for 3 seconds to allow the VM to start up
sleep 3

# Get the hostname of the current machine
hostname=$(hostname)

# Set the IP address based on the hostname
if [ "$hostname" == "desktop" ]; then
    ip="192.168.122.93"
elif [ "$hostname" == "laptop" ]; then
    ip="192.168.122.29"
else
    echo "Unknown hostname: $hostname"
    exit 1
fi

# Start an RDP session to the VM using xfreerdp
xfreerdp -grab-keyboard /v:$ip /u:joy /p:1 /size:100% /dynamic-resolution /gfx-h264:avc444 +gfx-progressive /sec:nla /bpp:32 /rfx /rfx-mode:video -bitmap-cache -offscreen-cache -glyph-cache

