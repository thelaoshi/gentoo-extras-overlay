# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit user

NAME="btsync"
DESCRIPTION="Fast, unlimited and secure file-syncing. Free from the cloud."
HOMEPAGE="http://labs.bittorrent.com/experiments/sync.html"
SRC_URI="
	amd64?	( https://download-cdn.getsync.com/${PV}/linux-x64/BitTorrent-Sync_x64.tar.gz )
	x86? ( https://download-cdn.getsync.com/${PV}/linux-i386/BitTorrent-Sync_i386.tar.gz )"

RESTRICT="mirror strip"
LICENSE="BitTorrent"
SLOT="0"
KEYWORDS="~amd64 ~x86"

QA_PREBUILT="opt/btsync/btsync"

S="${WORKDIR}"

pkg_setup() {

	# Let's set up the user and group for this daemon so that members of the group
	# can have write permissions.
	enewgroup btsync
	enewuser btsync -1 -1 /home/btsync btsync
}

src_install() {
	keepdir /home/btsync
	fowners btsync:btsync /home/btsync

	# Install the executable
	exeinto "/opt/${NAME}"
	doexe "${S}/${NAME}"

	# Install a default configuration file
	insinto "/etc/${NAME}"
	doins "${FILESDIR}/config-1"

	# Install the OpenRC init file
	newinitd "${FILESDIR}/btsync.init-2" btsyncd
}

pkg_postinst() {

	elog "In order for shared files between local users to be as easy as possible,"
	elog "please set up ACLs on your system."
	elog ""
	elog "You will also need to configure btsync by editing /etc/btsync/config"
	elog ""
	elog "After checking your config, start the service and point your browser to"
	elog "http://localhost:8888 , the default username and password is admin/admin."
	ewarn "Init script now changed to btsyncd, please make sure, correct one used"
}
