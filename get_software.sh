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
"http://curl.haxx.se/download/curl-7.39.0.tar.bz2" \
"https://www.openssl.org/source/openssl-1.0.1j.tar.gz" \
"http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.7p1.tar.gz" \
)		# This list will continue to grow.

# TODO: Microsoft Fonts

# TODO: Test protocols!
# TODO: Test URL sites. Do not extract if from github.com!
# TODO: If a site is from sourceforge, make sure that curl saves it as the file it should be downloading.
#		In other words, you can remove that trailing "/download" part. Curl should redirect thanks to -L.
#		So this TODO point is solved.  Unless it needs that "prodownloads" part. Nope. Not really. We're good!

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
  git)	;;			# Do nothing, for now.
  *)	;;			# Do nothing
 esac
 echo "${extract}"
}

for url in "${urls[@]}"; do
 curl -SLO "${url}" | $(extraction "${url}")
done
