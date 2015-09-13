# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libtreadstone/libtreadstone-0.1.0.ebuild,v 1.1 2015/01/13 02:38:17 patrick Exp $
EAPI=4

DESCRIPTION="Hyperdex libtreadstone support library"

HOMEPAGE="http://hyperdex.org"
SRC_URI="http://hyperdex.org/src/${P}.tar.gz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""

DEPEND=">=dev-libs/libpo6-0.6.0
	>=dev-libs/libe-0.9.0"
RDEPEND="${DEPEND}"