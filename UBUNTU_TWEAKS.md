## Fix brightness with xbacklight.
If you get the "No outputs have backlight property" error, it is because
xrandr/xbacklight does not choose the right directory in /sys/class/backlight.
You can specify the directory by setting the Backlight option of the device
section in xorg.conf. For instance, if the name of the directory is
intel_backlight, the device section can be configured as follows:

Add following to `/etc/X11/xorg.conf`

```
Section "Device"
    Identifier  "Card0"
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection
```

## Suspend when close lid.
### Modify /etc/systemd/logind.conf
```
[Login]
HandlePowerKey=hibernate
HandleLidSwitch=suspend
HoldoffTimeoutSec=30s
IdleAction=hybrid-sleep
IdleActionSec=10min
```

### Start systemd service.
- Move `lock-screen-before-suspending.service` to `/etc/systemd/system`
- Run `sudo systemctrl enable lock-screen-before-suspending.service`

## Touchpad tweaks
`cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf`
Append below snippet to `/etc/X11/xorg.conf.d/70-synaptics.conf`
```
Section "InputClass"
        Identifier "touchpad"
        MatchDriver "synaptics"
        MatchIsTouchpad "on"
            Option "HorizTwoFingerScroll" "on"
            Option "HorizEdgeScroll" "on"
            Option "PalmDetect" "1"
            Option "PalmMinWidth" "8"
            Option "PalmMinZ" "100"
            Option "VertEdgeScroll" "on"
            Option "VertTwoFingerScroll" "on"
            Option "MaxTapTime" "125"
EndSection
```
