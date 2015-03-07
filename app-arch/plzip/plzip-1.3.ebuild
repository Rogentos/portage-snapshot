# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-arch/plzip/plzip-1.3.ebuild,v 1.1 2015/01/27 15:29:21 mgorny Exp $

EAPI=5

inherit toolchain-funcs

DESCRIPTION="Parallel lzip compressor"
HOMEPAGE="http://www.nongnu.org/lzip/plzip.html"
SRC_URI="http://download.savannah.gnu.org/releases-noredirect/lzip/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="app-arch/lzlib"

src_configure() {
	# not autotools-based
	./configure \
		--prefix="${EPREFIX}"/usr \
		CXX="$(tc-getCXX)" \
		CPPFLAGS="${CPPFLAGS}" \
		CXXFLAGS="${CXXFLAGS}" \
		LDFLAGS="${LDFLAGS}" || die
}