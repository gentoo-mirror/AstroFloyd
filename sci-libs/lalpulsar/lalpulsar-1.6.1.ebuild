# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Pulsar (continuous-wave) package of the LIGO/Virgo libraries"
HOMEPAGE="https://wiki.ligo.org/Computing/LALSuite"
SRC_URI="https://software.igwn.org/sources/source/lalsuite/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sci-libs/lal
		sci-libs/fftw
		sci-libs/gsl
		sys-libs/zlib
	"
RDEPEND=${DEPEND}

pkg_postinst() {
	elog "\n    Now you may want to setup your environment:"
	elog "\n    Bourne shell [bash] users: please add the following line to your .profile file:"
	elog "\n        . /etc/lalpulsar-user-env.sh"
	elog "\n    C-shell [tcsh] users: please add the following line to your .login file:"
	elog "\n        source /etc/lalpulsar-user-env.csh"
	elog ""
}
