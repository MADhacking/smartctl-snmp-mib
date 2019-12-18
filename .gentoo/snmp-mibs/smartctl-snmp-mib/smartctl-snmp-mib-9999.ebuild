# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="An SNMP MIB to represent HDD SMART data"
HOMEPAGE="https://github.com/GITHUB_REPOSITORY"
LICENSE="LGPL-3"

if [[ ${PV} = *9999* ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/GITHUB_REPOSITORY"
    EGIT_BRANCH="GITHUB_REF"
else
    SRC_URI="https://github.com/GITHUB_REPOSITORY/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

KEYWORDS=""
IUSE="test"
SLOT="0"

RESTRICT="!test? ( test )"

RDEPEND="snmp-mibs/hacking-snmp-mib"
DEPEND="test? ( ${RDEPEND} net-libs/libsmi )"

src_test() {
    files=("usr/share/snmp/mibs/SMARTCTL-MIB.txt")
    exitval=0
    for f in ${files[*]}; do
        if (( $(smilint -s --level=4 "${f}" 2>&1 | wc -l ) > 0 )); then
            echo "${f} - failed tests"
            exitval=1
            smilint -s --level=4 "${f}" 2>&1
        fi
    done
    (( exitval > 0 )) && die "Tests failed"
}

src_install() {
    einstalldocs

    insinto /usr/share/snmp/mibs
    doins usr/share/snmp/mibs/*
}
