#
# Copyright (C) 2006-2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ethtool
PKG_VERSION:=6.10
PKG_RELEASE:=1

PKG_MAINTAINER:=Felix Fietkau <nbd@nbd.name>
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=@KERNEL/software/network/ethtool
PKG_HASH:=cc613fe8a2bcddee17a1e6e0d763c0f3ea33c7e930658d2d7f601aa65e426a1f

PKG_LICENSE:=GPL-2.0
PKG_LICENSE_FILES:=COPYING

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1
PKG_BUILD_PARALLEL:=1

PKG_CONFIG_DEPENDS:=CONFIG_ETHTOOL_PRETTY_DUMP

include $(INCLUDE_DIR)/package.mk

define Package/ethtool
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Display or change ethernet card settings
  URL:=https://www.kernel.org/pub/software/network/ethtool/
endef

define Package/ethtool/description
 ethtool is a small utility for examining and tuning your ethernet-based
 network interface
endef

define Package/ethtool/config
	config ETHTOOL_PRETTY_DUMP
		depends on PACKAGE_ethtool
		bool "Enable pretty printing"
endef

CONFIGURE_ARGS += --disable-netlink

ifeq ($(CONFIG_ETHTOOL_PRETTY_DUMP),y)
CONFIGURE_ARGS += --enable-pretty-dump
else
CONFIGURE_ARGS += --disable-pretty-dump
endif

define Package/ethtool/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ethtool $(1)/usr/sbin
endef

$(eval $(call BuildPackage,ethtool))
