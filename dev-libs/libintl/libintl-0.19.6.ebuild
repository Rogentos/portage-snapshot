# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

# Note: Keep version bumps in sync with sys-devel/gettext.

EAPI="5"

MY_P="gettext-${PV}"

inherit eutils multilib-minimal toolchain-funcs libtool

DESCRIPTION="the GNU international library (split out of gettext)"
HOMEPAGE="https://www.gnu.org/software/gettext/"
SRC_URI="mirror://gnu/gettext/${MY_P}.tar.gz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd"
IUSE="static-libs +threads"

DEPEND=">=virtual/libiconv-0-r1[${MULTILIB_USEDEP}]"
# Block C libraries known to provide libintl.
RDEPEND="${DEPEND}
	!sys-libs/glibc
	!<sys-devel/gettext-0.19.6-r1"

S="${WORKDIR}/${MY_P}/gettext-runtime"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.19.5-langinfo.patch

	# The libtool files are stored higher up, so make sure we run in the
	# whole tree and not just the subdir we build.
	elibtoolize "${WORKDIR}"
}

multilib_src_configure() {
	local myconf=(
		# Emacs support is now in a separate package.
		--without-emacs
		--without-lispdir
		# Normally this controls nls behavior in general, but the libintl
		# subdir is skipped unless this is explicitly set.  ugh.
		--enable-nls
		# This magic flag enables libintl.
		--with-included-gettext
		# The gettext package provides this library.
		--disable-c++
		--disable-libasprintf
		# No java until someone cares.
		--disable-java

		$(use_enable static-libs static)
		$(use_enable threads)
	)
	ECONF_SOURCE=${S} econf "${myconf[@]}"
}

multilib_src_install() {
	# We only need things in the intl/ subdir.
	emake DESTDIR="${D}" install -C intl

	gen_usr_ldscript -a intl
}

multilib_src_install_all() {
	use static-libs || prune_libtool_files --all

	rm -f "${ED}"/usr/share/locale/locale.alias "${ED}"/usr/lib/charset.alias

	dodoc AUTHORS ChangeLog NEWS README
}
