# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="FS-UAE Amiga Emulator"
HOMEPAGE="http://fs-uae.net"

SRC_URI="http://fs-uae.net/fs-uae/stable/${PV}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
#IUSE="+launcher"
#S="${S}stable"

DEPEND=">media-libs/libsdl-1.2
	media-libs/libpng
	sys-libs/zlib
	>dev-libs/glib-2.24
	media-libs/openal
	virtual/opengl"
RDEPEND="${DEPEND}"

src_configure() {
	elog "no configure needed"
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die "Install Failed!"
	dodoc README example.conf ChangeLog || die
}
