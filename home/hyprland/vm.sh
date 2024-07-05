virsh --connect qemu:///system start Windows
sleep 3 
xfreerdp -grab-keyboard /v:192.168.122.93 /u:joy /p:1 /size:100% /d: /dynamic-resolution /gfx-h264:avc444 +gfx-progressive
