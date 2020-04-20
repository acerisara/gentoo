# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_{6,7,8} )

DISTUTILS_USE_SETUPTOOLS=no
inherit distutils-r1

DESCRIPTION="Python fork of SmartyPants, a plug-in to translate punctuation characters"
HOMEPAGE="https://github.com/leohemsted/smartypants.py https://pypi.org/project/smartypants"
SRC_URI="https://github.com/leohemsted/${PN}.py/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~sparc ~x86 ~x86-linux"

LICENSE="BSD BSD-2"
SLOT="0"
S="${WORKDIR}/${PN}.py-${PV}"
IUSE=""

DEPEND=""
RDEPEND=""

distutils_enable_sphinx docs
distutils_enable_tests setup.py

DOCS=( README.rst COPYING CHANGES.rst )
