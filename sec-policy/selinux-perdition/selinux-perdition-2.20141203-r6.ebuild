# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-perdition/selinux-perdition-2.20141203-r6.ebuild,v 1.2 2015/07/02 18:06:53 perfinion Exp $
EAPI="5"

IUSE=""
MODS="perdition"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for perdition"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="amd64 x86"
fi