#!/bin/bash
# File: split.sh
# Author: Jason Charney (jrcharneyATgmailDOTcom)
# Info: This file serves two purposes:
#	1. To jog my memory (and yours if you need it) about how Bash manipulates strings
#	2. Breaks a URL string in to useful parts for other programs to use.

# URL example:
# https://www.github.com:80/jrcharney/kodos/package.tar.gz

# TODO: Recognize protocols and have specific programs handle them
# TODO: Recognize domains (github.com, bitbucket.com, etc.)
# TODO: Recognize top-level domans (TLDs)  (Know a .com from a .co from a .gob.co) (Work in progress)
# TODO: Recognize IP addresses (should be easy for IPv4 format (x.x.x.x where x is a number between 0 and 255)
# TODO: Recognize ports
# TODO: Recognize file types and handle them approrpirately. (Useful for package extraction which get_software.sh does.)

help(){
 cat <<EOF
Split.sh - spits out URL info.

This program requires only ONE argument, a URL, File path, or Filename to test.
For now, we're just doing URLs because that is what this script was designed for.
Eventually, Files paths can be tested (probably using "file://" as the protocol, unless there is no protocol.)
followed by files (if there happens to be no path to test.)

Syntax: split.sh https://www.github.com:80/jrcharney/kodos/package.tar.gz
EOF
exit 0
}

[[ $# == 0 ]]&& help

URL=$1

# PROTOCOL
protocolonly=${URL%%://*}		# Returns the protocol part
noprotocol=${URL##*://}			# Returns the opposite of protocol
# TODO: What if there never was a protocol?  Return the URL, recognize it as a file path. I'll deal with it later.

# DOMAIN
domain=${noprotocol%%/*}		# Returns the domain name, without path, including the port number if there is one
domainname=${domain%%:*}		# Domain name without port number
# domainsub=${domainname%.*}	# TODO: This needs work.  If it returns "www" count set to blank.  This should be the part before the domain's root word.
domainroot=${domainname#*.}		# The domain's root word and TLD.  Needs work.
domaintld=${domainname##*.}		# The domain's Top-Level Domain (TLD). Needs work, especially if some URLs are for other countries.
[[ $domainroot == $domaintld ]] && domainroot=$domainname	# ensures that domainroot doesn't return something like ".com"  Needs work.

# PORT
domainport=${domain##*:}		# Returns the domain port if there is one.
[[ $domain == $domainport ]] && domainport=""		# If there is no port, set it to blank

# PATH
urlfilepath=${noprotocol#*/}	# Everything after the first "/".  URLs should end with "/"
filepath=${urlfilepath%/*}		# The file path not including the file.  File paths should ALWAYS end with "/" otherwise they will be interpreted as a file.
filename=${urlfilename##*/}		# The file name.  Be aware that some directories have periods (".") in them.  TODO: If only there was some way to remotely detect if a file was a directory or file.  There might be, but I'm drawing a blank at the moment.
[[ $urlfilepath == $filepath ]] & filepath=""		# If there is no file path, set it to blank

# FILE
# TODO: What if a file has a version number that uses periods?
# The most we really want to to is first and second level stuff.
# Second level stuff should only occur if a first level suffix is recongized.
# For example, we can return .gz as the file type of a file then look to see if it as a .tar suffix.
filetype=
filesuffix=
filesubfix=
filesuperfix=
