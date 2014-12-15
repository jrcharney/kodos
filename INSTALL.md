# Installing Kodos

When I'm done, figuring out what order these pieces should go in (which might be added to this file later) and how to cross compile it for various operating system (again, here, except for some things Raspberry Pi can't do like OpenGL and MySQL), I hope to post an `.img` file or a compressed `.img.tar.xz` file of Kodos.  I might also post it on a torrent site or too.

Actually, I was thinking as part of these install instructions, I would also include the **construction** instructions.

But for now, it might just start out as an alpha `.img` file until I can make a construction script.

That should be a new buzzword. "Construction".  We plan. We design. We construct. We compile. We build. We install. We upgrade. (weeee!!!) :-)

Consider Kodos as the Plan-Design-Construct part that complements the Compile-Build-Install part that Linux users recongize as `./configure && make && sudo make install'.

Kodos is a blueprint for an operating system.  You put it together!  We've just given you a bag of Legos and instruction booklet for everyone to follow.  Linux From Scratch does well to describe the instructions for each architechture.  Kodos mainstreams the LFS process.

## Instructions from (Compressed)

Firsty, Kodos is initially set up for an Odroid U3.  Eventually, I'd like to get the more powerful ODroid XU3, but it just wasn't in my budget at the time.

You can get an Odroid from [Ameridroid.com](http://ameridroid.com/) (US, Canada, Worldwide), [Pollin.de](http://www.pollin.de/) (Germany and the EU), and of course at [Hardkernel.com](http://www.hardkernel.com/) (Korea, Asia, and Worldwide).

If you live in the United States like I do, I would recommend giving Ameridroid a try.  Hopefully it won't cost $35 to ship from Korea to US like it did for me.

And like any Single-Board Computer (SBC), don't forget to buy the accessories.

Now about those instructions.

If you happen to be living in close proximity of a cheap source of SD cards (i.e. a MicroCenter), I recommend you get a 32GB microSD card.  As much as eMMC touts speed as a feature, availablity and cost still make microSD cards attractive.

```
# Eventually this curl step will be replaced with a `git clone` command and instructions to run a bash script that will download all sorts of packages that will download, cross-compile and package an `.img` file to burn to a microSD card using the `dd` command.
curl -SL https://github.com/jrcharney/kodos/releases/Kodos-${version}.img.tar.xz | tar xJvf
df -h
# insert your SD Card
df -h
# a /dev/sdX1 should show up. Where X is a drive number.
# If your desktop software opens a window (or more than one window if the SD card has more than one partition), close the windows.
sudo umount /dev/sdX*		# Use * if there is more than one partition
# If your SD card was not blank but you want to erase it do `sudo dd if=/dev/zero of=/dev/sdX bs=512M && sync` first to wipe it
sudo dd if=Kodos-${version}.img of=/dev/sdX bs=512M			# This will mount the image to the SD card
# We recommend you do this in tmux so that while you wait you can run this command in another pain to check on its status
#		watch -n5 'sudo pkill -USR1 -n -x dd'
# When the window says the SD card is full and can't store anymore data, you can stop it by pressing `^C` (`CTRL+C`)
sudo sync		# this will make it OK to unplug the device.
```

Keep in mind this is intentionally being designed to work with an ODroid U3.  A "Light" version of Kodos (which might be called "Kang") will be made for Raspberry Pi since Raspberry Pi current doesn't have the power that an ODroid has. (The Odroid U3 is about 16x more powerful than a Rasberry Pi B+.)
