# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="3"

inherit distutils

DESCRIPTION="FS-UAE Amiga Emulator Launcher"
HOMEPAGE="http://fs-uae.net"

SRC_URI="http://fs-uae.net/fs-uae/stable/${PV}/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
#IUSE="+launcher"
#S="${S}stable"

DEPEND="dev-python/PyQt4"
RDEPEND="${DEPEND}"

pkg_setup() {
	python_set_active_version 3
	python_pkg_setup
}

src_configure() {
	elog "no configure needed"
}

src_compile() {
	distutils_src_compile || die
}

src_install() {
	cp -a "share" "${D}/usr/"
	distutils_src_install || die
}
