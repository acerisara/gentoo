# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
inherit distutils-r1

DESCRIPTION="Python-2.7 random module ported to python-3"
HOMEPAGE="https://pypi.org/project/random2/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

BDEPEND="app-arch/unzip
	dev-python/setuptools[${PYTHON_USEDEP}]"

distutils_enable_tests setup.py

PATCHES=( "${FILESDIR}/${P}-py39-tests.patch" )
