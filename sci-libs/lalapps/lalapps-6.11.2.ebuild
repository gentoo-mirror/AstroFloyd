# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Applications for gravitational-wave data analysis with LIGO/Virgo"
HOMEPAGE="https://www.lsc-group.phys.uwm.edu/daswg/projects/lalsuite.html"
SRC_URI="https://www.lsc-group.phys.uwm.edu/daswg/download/software/source/lalsuite/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +mpi +metaio +frame xml"

DEPEND="sci-libs/lal
		frame? ( sci-libs/libframe
				 sci-libs/lalframe )
		metaio? ( sci-libs/metaio
				  sci-libs/lalmetaio )
		xml? ( sci-libs/lalxml )
		mpi? ( virtual/mpi )
	   "
RDEPEND=${DEPEND}

src_configure() {
	econf \
		$(use_enable frame) \
		$(use_enable frame lalframe) \
		$(use_enable metaio) \
		$(use_enable metaio lalmetaio) \
		$(use_enable xml lalxml) \
		$(use_enable mpi)
}

src_compile() {
	emake
	use doc  &&  emake dvi
}

pkg_postinst() {
	elog "\n    Now you may want to setup your environment:"
	elog "\n    Bourne shell [bash] users: please add the following line to your .profile file:"
	elog "\n        . /etc/lalapps-user-env.sh"
	elog "\n    C-shell [tcsh] users: please add the following line to your .login file:"
	elog "\n        source /etc/lalapps-user-env.csh"
	elog ""
}
