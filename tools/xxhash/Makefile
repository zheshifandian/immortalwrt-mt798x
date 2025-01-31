# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=xxHash
PKG_VERSION:=0.8.3

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://codeload.github.com/Cyan4973/xxHash/tar.gz/v$(PKG_VERSION)?
PKG_HASH:=aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80

PKG_LICENSE:=BSD-2-Clause
PKG_LICENSE_FILES:=LICENSE

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/cmake.mk

CMAKE_C_COMPILER_LAUNCHER :=
CMAKE_CXX_COMPILER_LAUNCHER :=

CMAKE_BINARY_SUBDIR := build
CMAKE_SOURCE_SUBDIR := cmake_unofficial

$(eval $(call HostBuild))
