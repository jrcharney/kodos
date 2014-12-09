kodos
=====

A Linux from Scratch style Distro for Odroid users and eventually anyone else who wants to make Linux awesome

> "Don't blame me, *I* voted for Kodos!" --Homer Simpson

Kodos is a Linux From Scratch distribution that allows you to do all the things Ubuntu, Debian, Raspbian and a few other Linux distros would never do.

## Why do this? Aren't there restructions?

To heck with what the Unix and Linux beards think!  You want to use Linux and tell your OSX wannabe hacker friends you don't need a Mac to have an awesome operating system.  The parts are all there to make Linux awesome, unfortunately, most binary distributions choose to half-ass their approach and the result is you practically need to uninstall the entire damn operating system just to make one project you downloaded off GitHub work.

## Why LFS instead of Binary? Won't it break if (insert software here) is upgraded?

You shouldn't have to wait for the Debian or RedHat folks

## Why not use ArchOS?

Because I've already learned how to use `yum` and `apt-get`.  I don't want to learn another software installation program.  Infact, compling should be done in one step!  A script that does all of this stuff

```bash
#!/bin/bash
#TODO: Make this a for-real script.

url=$1          # URL of a package, let's say it a .tar.xz file
$extract=xJvf   # extract based on url file's extension. A function would be used here
$project=       # The folder that this download will likely be in.  A function would be used here
curl -SLO $url | tar $extract && cd project && ./configure && make && sudo make install && sudo ldconfig
```

Of course that's just a idealized user case.  Other thing will be though of such as if you were cloning a project from GitHub or of the project requires `cmake` style instructions where you need to `cd build && cmake ..`.

The whole point building a Linux distro, installing or upgrading software, or any other task that involves using better newer Linux software from source (as it was designed for), shouldn't require disconnecting yourself from the rest of the world for the next few days and should not be reserved to a small group.  The first reason is just bad for your health.  The second reason is contradictory to having Free Open Source Software (FOSS).

## So what do you want to install?

Here's a full list of things I'd like to install.  They should also be the most up-to-date and stable software.  If latest or bleeding-edge software is require, it shouldn't require disassembling everything to make something new work.  It's an operating system, not a car dashboard!

```
bash
binutils
bzip2
coreutils
diffutils
findutils
gawk
gcc         # clang probably still needs gcc
glibc
grep
gzip
make
patch
sed
tar

curl
wget
ssh         # OpenSSL
git         # obviously
cmake
clang       # Old and busted: gcc; New hotness: clang
python      # Practically everyone uses it 
perl        # This old camel still has a few tricks
Cython

urvxt       # I have big plans for this thing!
tmux        # and this too!
vim         # because nano sucks
emacs       # because some people like to torture themselves

X           # I can't imagine Linux without it
fluxbox     # I go a bone to pick with old gtk+ versions being using with GNOME

gdk-pixbuf
cairo
pango
atk
gtk+
glib
gobject-introspection
keybinder
clutter
finalterm   # I wanted to try this out, but it requires all that other stuff
gimp        # Raster graphics and GIF animation. It's what gtk was meant for.
            # Good luck trying to us it on an Odroid U3 though.
inkscape    # SVG graphics.  Basically uses the same resources as The GIMP. 

ghostscript
TeXLive
xpdf

# Wireless connection stuff.  (Its sucks that you have to start out hooked up to an eithernet cable! Get with the program, mdrjr!)
# Bluetooth connection stuff. (Just in case you need it.)
# json stuff.  (Because it's better than XML)
# USB stuff
# HDMI stuff
```

What won't be installed with Kodos

```
ruby        # Go to rvm.io and install it from there.  Ditto for jRuby and Rails
node        # Node has some issue where you need to modify it or else you'll get a Segmentation Fault.
java        # Good news! Java works with ARM and it's not an old version like mdrjr's distro.  Get it from Oracle.
mysql       # It's still good. I just don't want to force it upon you.
php         # It's peanut butter to mysql/mariadb's jelly.
nginx       # Nimble, configurable, and way more tolerable than Apache Httpd.
mariadb     # Again you can install this or install mysql
mongodb     # ditto
libreoffice # You'll need java first before using it.  
            # Frankly, I want Kodos to use Google Chrome so that Google Docs, Sheets, and Slides can be used.
Qt          # For now anyway.  It's a pain in the neck to install, but you'll need it eventually.
haskell     # looks interesting

ember
backbone
express
bootstrap
coffeescript
jquery
metor       # I read it was like rails but for node.
sass
haml

wireshark   # Hacker stuff.  Compiled on my odroid but I think it broke when I upgraded something.
armitage    # It's metasploit with extras. Needs an ARM distro.
metasploit  # Hack, hack, hackity, hack!    Needs an ARM distro.
maltego     # This is probably not going to happen on ARM
rtl-sdr     # Software defined radio!
gnuradio    # Software defined radio!
tor         # I'm still on the fence about this.  Especially since I'd like to limit where my tor connection
            # is rerouted.
i2p2        # better than tor, but I still don't know how to use it.

steam       # Definitely not going to be on ARM...yet. 
            # (Come on, Gabe!  If the Japanese still can't get enough of playing games on cellphones, 
            # why can't us Westerner?  It's because of our "ADHD need to finish a game in 8 hours", isn't it?  
            # (Gaming is so much more fun when you take your time, kids! Read a book once in a while!)
minecraft   # You damn right, minecraft!  And the version that is most recent. Not some old version. 
            # (Waiting for an update? AIN'T NOBODY GOT TIME FOR THAT!)
# Drivers for game devices.     # must have, espeically for steam.  I want to find something new for Dualshock controlers that won't screw up bluetooth for everything else.
# Game emulators
# Netflix   # Linux users can watch Netflix on Google Chrome now!
kodi        # formerly xbmc. I haven't messed with it, but it's worth looking into
Spotify

Google Chrome   # What can I say, I'm a sucker for good browsers even if they are owned by questionable large corporate data vacuums.
Firefox         # Because why not.
Yandex Broswer  # I here the Russian search engine Yandex has a browser.  I wonder what that's like?  (Don't worry, the Yandex folks think Puntin needs to get a life too. As does Mikhael Gorbachov!)
Chromium        # Because not everyone like Chrome but they need it anyway.
Opera           # Because people are weird

xscreensavers   # Old stuff
```

What you probably should stop using anyway

```
nano            # I don't care how easy it is.  Use vim or emacs or go back to using Windows!
apache httpd    # Nginx is the new hotness.
midori          # man that browser SUCKS!
ice-weasel      # worse than midori. Firefox clone for ARM. It thinks ARM only is for mobile devices so it sends you to mobile sites. Being stupid is worse than being sucky.
angular-js      # If you want to use new attributes in HTML5 that aren't part of HTML5, USE XML!
```

What else am I missing?
