# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

DESCRIPTION="PaX flags maintenance daemon"
HOMEPAGE="http://www.grsecurity.net/"
SRC_URI="https://dev.gentoo.org/~blueness/hardened-sources/paxctld/${PN}_${PV}.orig.tar.gz"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc ~x86"
IUSE="pam"

RDEPEND=""
DEPEND=""

src_prepare() {
	# Respect Gentoo flags and don't strip
	sed -i \
		-e '/^CC/d' \
		-e '/^CFLAGS/d' \
		-e '/^LDFLAGS/d' \
		-e '/STRIP/d' \
		Makefile
}
