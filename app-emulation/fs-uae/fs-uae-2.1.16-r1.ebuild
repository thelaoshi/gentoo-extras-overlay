# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="FS-UAE Amiga Emulator"
HOMEPAGE="http://fengestad.no/fs-uae/"
SRC_URI="http://fengestad.no/${PN}/devel/${PV}dev/${P}dev.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
#IUSE="+launcher"
S="${S}dev"

DEPEND=">media-libs/libsdl-1.2
	media-libs/libpng
	sys-libs/zlib
	>dev-libs/glib-2.24
	media-libs/openal
	virtual/opengl
	dev-python/wxpython
	dev-python/pygame"
RDEPEND="${DEPEND}"

src_configure() {
	elog "no configure needed"
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die "Install Failed!"
	dodoc README example.conf Changelog || die
	cd "${S}/launcher" || die
	cp -a "share" "${D}/usr/"
	distutils_src_install || die
}
