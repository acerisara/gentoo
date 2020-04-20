# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )

DISTUTILS_USE_SETUPTOOLS="rdepend"
inherit distutils-r1

DESCRIPTION="Tool for transforming reStructuredText to PDF using ReportLab"
HOMEPAGE="https://rst2pdf.org/ https://pypi.org/project/rst2pdf/"
SRC_URI="https://github.com/rst2pdf/rst2pdf/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-python/docutils[${PYTHON_USEDEP}]
	 dev-python/jinja[${PYTHON_USEDEP}]
	 dev-python/pdfrw[${PYTHON_USEDEP}]
	 dev-python/pygments[${PYTHON_USEDEP}]
	 dev-python/reportlab[${PYTHON_USEDEP}]
	 dev-python/setuptools[${PYTHON_USEDEP}]
	 dev-python/six[${PYTHON_USEDEP}]
	 dev-python/smartypants[${PYTHON_USEDEP}]
	 dev-python/pillow[${PYTHON_USEDEP}]
	 dev-python/svglib[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}
	test? ( dev-python/nose[${PYTHON_USEDEP}] \
                dev-python/coverage[${PYTHON_USEDEP}] \
                dev-python/PyPDF2[${PYTHON_USEDEP}] \
                dev-python/sphinx[${PYTHON_USEDEP}] \
                dev-python/matplotlib[${PYTHON_USEDEP}] \
                media-gfx/inkscape )
"

DOCS=( CHANGES.rst doc/manual.rst doc/rst2pdf.rst )

python_test() {
	distutils_install_for_testing

	# tests using aafigure extension, which is not supported
	touch ${PN}/tests/input/test_aafigure.ignore
	touch ${PN}/tests/input/test_aafigure_extra.ignore
	touch ${PN}/tests/input/sphinx-issue257.ignore

	# tests with unknown md5 checksum
	touch ${PN}/tests/input/source.ignore
	touch ${PN}/tests/input/test_box_widths.ignore
	touch ${PN}/tests/input/test_issue_310_2.ignore
	touch ${PN}/tests/input/test_issue_311.ignore
	touch ${PN}/tests/input/test_issue_473.ignore
	touch ${PN}/tests/input/test_issue_83.ignore
	touch ${PN}/tests/input/test_fancytitles.ignore
	touch ${PN}/tests/input/test_slides.ignore
	touch ${PN}/tests/input/sphinx-issue319.ignore
	touch ${PN}/tests/input/sphinx-issue320.ignore

	PATH=${PATH}:${TEST_DIR}/scripts nosetests -vv -i regulartest -i sphinxtest || die "Test suite failed under ${EPYTHON}"
}

pkg_postinst() {
	elog "rst2pdf can work with the following packages for additional functionalities:"
	elog "   dev-python/sphinx       - sphinx support"
	elog "   dev-python/matplotlib   - matplotlib support"
	elog "   dev-python/inkscape     - inkscape support"
	elog ""
	elog "It also supports wordaxe, aafigure and xhtml2pdf, but these packages"
	elog "are not available in the portage tree yet. Please refer to the manual"
	elog "installed in /usr/share/doc/${PF}/ for more information."
}
