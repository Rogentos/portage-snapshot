# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
ROS_REPO_URI="https://github.com/lagadic/vision_visp"
KEYWORDS="~amd64 ~arm"
VER_PREFIX="jade-"
ROS_SUBDIR=${PN}

inherit ros-catkin

DESCRIPTION="Virtual package providing ViSP related packages"
LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="
	dev-ros/visp_auto_tracker
	dev-ros/visp_bridge
	dev-ros/visp_camera_calibration
	dev-ros/visp_hand2eye_calibration
	dev-ros/visp_tracker
"
DEPEND=""
if [ "${PV#9999}" = "${PV}" ] ; then
	S="${WORKDIR}/vision_visp-jade-${PV}/${ROS_SUBDIR}"
fi