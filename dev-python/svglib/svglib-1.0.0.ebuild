# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )

DISTUTILS_USE_SETUPTOOLS=bdepend
inherit distutils-r1

DESCRIPTION="A pure Python library for reading and converting SVG"
HOMEPAGE="https://github.com/deeplook/svglib https://pypi.org/project/svglib/"
SRC_URI="https://github.com/deeplook/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="LGPL-3"
SLOT="0"
IUSE="test"

RDEPEND="
	dev-python/reportlab[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/tinycss2[${PYTHON_USEDEP}]
	dev-python/cssselect2[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}
	test? ( dev-python/pytest[${PYTHON_USEDEP}]  )
"

PATCHES=(
	"${FILESDIR}/disable-network-tests.patch"
)

DOCS=( README.rst LICENSE.txt CHANGELOG.rst )
distutils_enable_tests pytest
