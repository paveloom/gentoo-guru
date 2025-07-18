# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KF5MIN=5.102.0
KFMIN=6.10.0
QTMIN=6.6.0

inherit git-r3 cmake

DESCRIPTION="Klassy QT6 window decoration theme for KDE Plasma 6.3+"
HOMEPAGE="https://github.com/paulmcauley/klassy"
EGIT_REPO_URI="https://github.com/paulmcauley/klassy"
EGIT_BRANCH="master"

LICENSE="GPL-2 GPL-2+ GPL-3 GPL-3+ LGPL-2.1+ MIT"
SLOT="0"
KEYWORDS=""
# Testing is unsupported in upstream.
RESTRICT="test"

DEPEND=">=dev-qt/qtbase-${QTMIN}:6
		>=dev-qt/qtdeclarative-${QTMIN}:6
		>=dev-qt/qtsvg-${QTMIN}:6
		>=kde-frameworks/frameworkintegration-${KF5MIN}:5
		>=kde-frameworks/frameworkintegration-${KFMIN}:6
		>=kde-frameworks/kcmutils-${KF5MIN}:5
		>=kde-frameworks/kcmutils-${KFMIN}:6
		>=kde-frameworks/kconfigwidgets-${KF5MIN}:5
		>=kde-frameworks/kiconthemes-${KF5MIN}:5
		>=kde-frameworks/kwindowsystem-${KF5MIN}:5
		kde-frameworks/extra-cmake-modules
		kde-frameworks/kcolorscheme
		kde-frameworks/kconfig
		kde-frameworks/kcoreaddons
		kde-frameworks/kguiaddons
		kde-frameworks/ki18n
		kde-frameworks/kiconthemes
		kde-frameworks/kirigami
		kde-frameworks/kwidgetsaddons
		kde-frameworks/kwindowsystem
		kde-plasma/kdecoration
		x11-misc/xdg-utils"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		"-DKDE_INSTALL_USE_QT_SYS_PATHS=ON"
		"-DBUILD_TESTING=OFF"
	)

	cmake_src_configure
}
