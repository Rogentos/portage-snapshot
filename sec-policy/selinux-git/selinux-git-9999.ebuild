# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-git/selinux-git-9999.ebuild,v 1.1 2015/01/29 10:13:51 perfinion Exp $
EAPI="5"

IUSE=""
MODS="git"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for git"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
fi