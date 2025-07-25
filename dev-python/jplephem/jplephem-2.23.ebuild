# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Python version of NASA DE4xx ephemerides for Astronomical Alamanac"
HOMEPAGE="https://pypi.org/project/jplephem/"
SRC_URI="https://github.com/brandon-rhodes/python-jplephem/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/python-${P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

PATCHES=( "${FILESDIR}/${PN}-fix-numpy-compat.patch" )

distutils_enable_tests unittest

python_test() {
	cd ci || die
	eunittest .
}
