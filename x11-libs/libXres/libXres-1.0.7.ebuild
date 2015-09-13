# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/libXres/libXres-1.0.7.ebuild,v 1.11 2015/03/03 11:32:04 dlan Exp $

EAPI=5
inherit xorg-2

EGIT_REPO_URI="git://anongit.freedesktop.org/git/xorg/lib/libXRes"
DESCRIPTION="X.Org XRes library"

KEYWORDS="alpha amd64 arm ~arm64 hppa ia64 ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""

RDEPEND="x11-libs/libX11
	x11-libs/libXext
	x11-proto/xextproto
	x11-proto/resourceproto"
DEPEND="${RDEPEND}"