# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
AUTOTOOLS_AUTORECONF=1
AUTOTOOLS_IN_SOURCE_BUILD=1

GIT_SHA1="5a46c4ced4ef899b398bcedf8ccd29d6f2584100"
inherit autotools-utils perl-module sgml-catalog toolchain-funcs

DESCRIPTION="A toolset for processing LinuxDoc DTD SGML files"
HOMEPAGE="https://gitlab.com/agmartin/linuxdoc-tools"
SRC_URI="https://gitlab.com/agmartin/${PN}/repository/archive.tar.gz?ref=upstream/${PV} -> ${P}.tar.gz"

LICENSE="MIT SGMLUG"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~ppc ~x86 ~x86-fbsd"
IUSE="doc"

RDEPEND="
	|| ( app-text/openjade app-text/opensp )
	app-text/sgml-common
	dev-lang/perl:=
	|| ( sys-apps/gawk sys-apps/mawk )
	sys-apps/groff
"
DEPEND="${RDEPEND}
	sys-devel/flex
	doc? (
		dev-texlive/texlive-fontsrecommended
		virtual/latex-base
	)
"

DOCS=( ChangeLog README )
S="${WORKDIR}/${PN}-upstream/${PV}-${GIT_SHA1}"

sgml-catalog_cat_include "/etc/sgml/linuxdoc.cat" \
	"/usr/share/linuxdoc-tools/linuxdoc-tools.catalog"

src_prepare() {
	# Use Gentoo doc install path.
	sed -i \
		-e "s%/share/doc/linuxdoc-tools%/share/doc/${PF}%" \
		Makefile.in

	autotools-utils_src_prepare
}

src_configure() {
	perl_set_version
	tc-export CC
	local myeconfargs=(
		--disable-docs
		--with-texdir="/usr/share/texmf/tex/latex/misc"
		--with-perllibdir="${VENDOR_ARCH}"
		--with-installed-iso-entities
	)
	use doc && myeconfargs+=(--enable-docs="txt pdf html")

	autotools-utils_src_configure
}

src_compile() {
	autotools-utils_src_compile
}

src_install() {
	# Prevent access violations from bitmap font files generation.
	export VARTEXFONTS="${T}/fonts"

	autotools-utils_src_install
}
