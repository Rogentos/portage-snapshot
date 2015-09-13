# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/DateTime-Format-HTTP/DateTime-Format-HTTP-0.400.0-r1.ebuild,v 1.2 2015/06/13 22:34:46 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=CKRAS
MODULE_VERSION=0.40
inherit perl-module

DESCRIPTION="Date conversion routines"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-perl/DateTime
	dev-perl/libwww-perl"
DEPEND="${RDEPEND}
	dev-perl/Module-Build"

SRC_TEST=do