# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/python-iwscan/python-iwscan-20080402-r1.ebuild,v 1.7 2015/04/08 08:05:05 mgorny Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 pypy )

inherit distutils-r1 flag-o-matic

DESCRIPTION="A Python extension for iwscan access"
HOMEPAGE="http://projects.otaku42.de/browser/python-iwscan"
SRC_URI="mirror://gentoo/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86"
IUSE=""

DEPEND="net-wireless/wireless-tools"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${P}-wireless-tools-30.patch"
)

python_configure_all() {
	append-flags -fno-strict-aliasing
}