#!/bin/bash
# File: get_software.sh
# Info: On the computer/hardrive/SD card you are not the one you are going to install Kodos on, 
# 		but are capable of downloading, quickly cross-compiling and assembling a working image,
#		use this script to download all the stuff we need.
#		The next script will arrange the pieces together.
# Software requirements: The constructing computer will need curl, wget, tar, git, and a few other things.

# NOTE: .tar.gz files are larger than .tar.bz2 and .tar.xz files, but in the case of uniformity, 
#		using packages of the same file extension helps make this script work better.

# TODO: Get a list of most up-to-date urls
# TODO: Don't extract URLs that use the git protocol or have a .git suffix.
#		In fact, more than likely, anything from github.com will not be extracted.
# Sites with a lot of packages:
# http://ftp.gnome.org/pub/gnome/sources/
# https://download.gnome.org/sources/
# http://ftp.gnu.org/gnu/
# http://ftp.openbsd.org/pub/OpenBSD/
# http://cgit.freedesktop.org/xorg/
# http://www.freedesktop.org/software/
# https://pypi.python.org/pypi/ (For Python)
# http://download.gimp.org/pub/ (For GIMP)
# DO NOT INCLUDE http://freecode.com/ links. The Freecode guys aren't updating anymore.
urls = ( \
"http://ftp.gnu.org/gnu/bash/bash-4.3.30.tar.gz" \
"http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.bz2" \
"http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz" \
"http://ftp.gnu.org/gnu/coreutils/coreutils-8.23.tar.xz" \
"http://ftp.gnu.org/gnu/diffutils/diffutils-3.3.tar.xz" \
"http://ftp.gnu.org/gnu/findutils/findutils-4.4.2.tar.gz" \
"http://ftp.gnu.org/gnu/gawk/gawk-4.1.1.tar.xz" \
"http://ftp.gnu.org/gnu/gcc/gcc-4.9.2/gcc-4.9.2.tar.bz2" \
"http://ftp.gnu.org/gnu/glibc/glibc-2.20.tar.xz" \
"http://ftp.gnu.org/gnu/grep/grep-2.21.tar.xz" \
"http://ftp.gnu.org/gnu/gzip/gzip-1.6.tar.xz" \
"http://ftp.gnu.org/gnu/make/make-4.1.tar.bz2" \
"http://ftp.gnu.org/gnu/patch/patch-2.7.1.tar.xz" \
"http://ftp.gnu.org/gnu/sed/sed-4.2.2.tar.bz2" \
"http://ftp.gnu.org/gnu/tar/tar-1.28.tar.xz" \
"http://ftp.gnu.org/gnu/cpio/cpio-2.11.tar.bz2" \
"http://ftp.gnu.org/gnu/sharutils/sharutils-4.14.tar.xz" \
"http://www.rarlab.com/rar/unrarsrc-5.2.3.tar.gz" \
"http://tukaani.org/xz/xz-5.0.7.tar.bz2" \
"http://ftp.gnu.org/gnu/bison/bison-3.0.2.tar.xz" \
"http://sourceforge.net/projects/flex/files/flex-2.5.39.tar.xz" \
"http://prdownloads.sourceforge.net/scons/scons-2.3.4.tar.gz" \
"http://ftp.gnu.org/gnu/wget/wget-1.16.1.tar.xz" \
"http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz" \
"http://ftp.gnu.org/gnu/automake/automake-1.14.1.tar.xz" \
"http://ftp.gnu.org/gnu/libtool/libtool-2.4.4.tar.xz" \
"http://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.xz" \
"http://ftp.gnu.org/gnu/less/less-451.tar.gz" \
"http://www.cmake.org/files/v3.1/cmake-3.1.0-rc3.tar.gz" \
"http://www.cpan.org/src/5.0/perl-5.20.1.tar.gz" \
"https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz" \
"http://curl.haxx.se/download/curl-7.39.0.tar.bz2" \
"https://www.openssl.org/source/openssl-1.0.1j.tar.gz" \
"http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.7p1.tar.gz" \
"https://github.com/engla/keybinder" \
"http://ftp.gnome.org/pub/gnome/sources/gtk+/3.14/gtk+-3.14.5.tar.xz" \
"http://ftp.gnome.org/pub/gnome/sources/glib/2.42/glib-2.42.1.tar.xz" \
"http://ftp.gnome.org/pub/gnome/sources/pango/1.36/pango-1.36.8.tar.xz" \
"http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.30/gdk-pixbuf-2.30.8.tar.xz" \
"http://ftp.gnome.org/pub/gnome/sources/atk/2.14/atk-2.14.0.tar.xz" \
"http://ftp.gnome.org/pub/gnome/sources/gobject-introspection/1.42/gobject-introspection-1.42.0.tar.xz" \
"https://download.gnome.org/sources/clutter-gtk/1.6/clutter-gtk-1.6.0.tar.xz" \
"https://github.com/clutter-project/mx.git" \
"http://sourceforge.net/projects/fluxbox/files/fluxbox/1.3.5/fluxbox-1.3.5.tar.bz2" \
"http://ftp.gnome.org/pub/gnome/sources/libnotify/0.7/libnotify-0.7.6.tar.xz" \
"https://launchpad.net/intltool/trunk/0.50.2/+download/intltool-0.50.2.tar.gz" \
"http://hisham.hm/htop/releases/1.0.3/htop-1.0.3.tar.gz" \
"http://eden-feed.erg.abdn.ac.uk/wavemon/stable-releases/wavemon-0.7.6.tar.bz2" \
"http://www.imagemagick.org/download/ImageMagick.tar.gz" \
"http://sourceforge.net/projects/numpy/files/NumPy/1.9.1/numpy-1.9.1.tar.gz" \
"http://sourceforge.net/projects/scipy/files/scipy/0.14.0/scipy-0.14.0.tar.gz" \
"https://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.4.2/matplotlib-1.4.2.tar.gz" \
"https://github.com/ipython/ipython/archive/rel-2.3.1.tar.gz" \
"https://github.com/pydata/pandas/archive/v0.15.2.tar.gz" \
"https://github.com/sympy/sympy/archive/sympy-0.7.6.tar.gz" \
"https://pypi.python.org/packages/source/n/nose/nose-1.3.4.tar.gz" \
"http://pkgconfig.freedesktop.org/releases/pkg-config-0.28.tar.gz" \
"http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.11.1.tar.bz2" \
"http://www.freedesktop.org/software/fontconfig/webfonts/webfonts.tar.gz" \
"http://download.gimp.org/pub/babl/0.1/babl-0.1.10.tar.bz2" \
"http://download.gimp.org/pub/gegl/0.2/gegl-0.2.0.tar.bz2" \
"http://prdownloads.sourceforge.net/aa-project/aalib-1.4rc4.tar.gz" \
"http://downloads.sourceforge.net/project/libexif/libexif/0.6.21/libexif-0.6.21.tar.bz2" \
"http://zlib.net/zlib-1.2.8.tar.xz" \
"http://prdownloads.sourceforge.net/libpng/libpng-1.6.15.tar.xz" \
"http://download.gimp.org/pub/gimp/v2.8/gimp-2.8.14.tar.bz2" \
"http://downloads.ghostscript.com/public/ghostscript-9.15.tar.gz" \
"http://downloads.sourceforge.net/inkscape/inkscape-0.48.5.tar.bz2" \
"http://dist.schmorp.de/rxvt-unicode/rxvt-unicode-9.20.tar.bz2" \
"http://invisible-island.net/datafiles/release/ncurses.tar.gz" \
"http://www.freedesktop.org/software/systemd/systemd-218.tar.xz" \
"http://downloads.sourceforge.net/tmux/tmux-1.9a.tar.gz" \
"https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz" \
"https://transmission.cachefly.net/transmission-2.84.tar.xz" \
"ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2" \
)		# This list will continue to grow.

# NOTE: I really want ot use Fluxbox as a window manager. See http://fluxbox.org/download/ for styles.
# NOTE: ImageMagick might have some slightly different instructions. Check http://imagemagick.org/script/install-source.php first.
# NOTE: We're installing Python 2 still.
# NOTE: We're also including the SciPy stack! (NumPy is your friend!)
# TODO: Do I really want to install Qt? (I'll need to, tragicly)
# TODO: Some optional GIMP resources were not installed because they were really old or their sites no longer existed.
# TODO: Microsoft Fonts
# TODO: Mac Fonts? If they exist.
# NOTE: Why yes, that is Transmission Bit Torrent client.  Everyone should use some kind of torrenting software.
# TODO: Figure out how to use I2P (https://geti2p.net/en/)
# TODO: Do I want to install Mercurial? Subversion? CVS?
#		An example of using Mercurial is on the Vim download page. http://www.vim.org/download.php
# TODO: What about Vim plugins like Pathogen (https://github.com/tpope/vim-pathogen) and NERDtree (https://github.com/scrooloose/nerdtree)?

# TODO: Test protocols!
# TODO: Test URL sites. Do not extract if from github.com!
# TODO: If a site is from sourceforge, make sure that curl saves it as the file it should be downloading.
#		In other words, you can remove that trailing "/download" part. Curl should redirect thanks to -L.
#		So this TODO point is solved.  Unless it needs that "prodownloads" part. Nope. Not really. We're good!

# Func: extraction
# Info: execute extraction instructions based on various url extensions
extraction(){
 url=$1
 pkg=${url##*/}					# Strip out the URL
 tpkg=${pkg,,}					# Lowercase the package string for testing
 fix=${pkg##*.}					# everything after the last period
 dir=${pkg%.*}					# everything before the last period
 
 case ${tpkg##*.} in			# Test based on everything after the last period
  tgz)		extract="tar xz" ;;
  tbz|tbz2)	extract="tar xj" ;;
  gz|bz|bz2|xz)
  	if [[ ${dir,,} =~ \.tar$ ]]; then
  		fix="${dir##*.}.${fix}"
  	 	dir="${dir%.*}"
  	 case ${tpkg##*.} in
  	  gz)		extract="tar xz" ;;
  	  bz|bz2)	extract="tar xj" ;;
  	  xz)		extract="tar xJ" ;;
  	 esac
  	else
  	 case ${tpkg##*.} in
  	  gz)		extract="gunzip" ;;
  	  bz|bz2)	extract="bunzip2" ;;
  	  xz)		extract="unxz" ;;
  	 esac
  	fi
  	;;
  tar)		extract="tar x" ;;
  cpio)		;;		# look into this
  shar)		;;		# look into this
  rar)		;;		# look into this. It might just be a simple "unrar"
  zip)		extract="unzip" ;;
  git)	 ;;			# Do nothing, for now.	# TODO: Better yet, let's not extract that type here.
  *)	;;			# Do nothing
 esac
 echo "${extract}"
}

for url in "${urls[@]}"; do
 # Download instructions will need to vary depending on the protocol used to fetch software.
 case "${url%%:*}" in
  http|https|ftp)
   # TODO: While we test package file extensions for the most part using the extraction() method, 
   #	tests for git repos and .git files should be done here.
   # Don't use -O in curl when piping to an extraction command.
   fix="${url,,}"			# lowercase the url string just in case
   case "${fix##*.}" in
    git) git clone $url ;;			# Clone git projects
    *)   curl -SL "${url}" | $(extraction "${url}") ;;
   esac ;;
  git)	git clone $url ;;	# TODO: This might not work for all git
  #file)	;;	# Maybe later. Use it as a hack to extract locally
  *)	;;	# For now, do nothing. An error will likely need to be thrown later.
done


# Making projects from source
# The standard recipe for making a project from source is generally
#	./configure && make && sudo make install
# I like to add an extra step
#	./configure && make && sudo make install && sudo ldconfig
# For most CMake made projects, you need to create a build directory first
#   mkdir build && cd build
#   cmake .. && make && sudo make install
# As per my preference, I like to run `sudo ldconfig` after the make install.
# For Linux From Scratch distros, adminstrators have to option to put change the path to /usr/bin.
# Some times, people will install experimental software in the /opt/ directory so they can delete everything related to it.  This is ideal for a couple of items.
# Users do have the option of changing the prefix of the install using "-DPREFIX" (shorthand of "-D -PREFIX") or "-PREFIX" or something like that. YMMV.
# And then there are the changes to the ~/.bashrc file (or some other file like it.) But we'll talk about that later.
