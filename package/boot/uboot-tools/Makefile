include $(TOPDIR)/rules.mk

PKG_DISTNAME:=u-boot
PKG_VERSION:=2026.01
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_DISTNAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:= \
	https://ftp.denx.de/pub/u-boot \
	https://mirror.cyberbits.eu/u-boot \
	ftp://ftp.denx.de/pub/u-boot
PKG_URL:=https://docs.u-boot.org/en/latest/
PKG_HASH:=b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54
PKG_SOURCE_SUBDIR:=$(PKG_DISTNAME)-$(PKG_VERSION)
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_DISTNAME)-$(PKG_VERSION)

PKG_BUILD_DEPENDS:=fstools

PKG_LICENSE:=GPL-2.0 GPL-2.0+
PKG_LICENSE_FILES:=Licenses/README

PKG_BUILD_PARALLEL:=1
#PKG_FLAGS:=nonshared # Use PKGFLAGS instead of PKG_FLAGS for per-binary flags

include $(INCLUDE_DIR)/package.mk

define Package/uboot-envtools
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=Boot Loaders
	TITLE:=read/modify U-Boot bootloader environment
endef

define Package/uboot-envtools/description
	This package includes tools to read and modify U-Boot
	bootloader environment.
endef

define Package/uboot-envtools/conffiles
	/etc/config/ubootenv
	/etc/fw_env.config
	/etc/fw_sys.config
endef

define Build/Configure
	touch $(PKG_BUILD_DIR)/include/config.h
	mkdir -p $(PKG_BUILD_DIR)/include/config
	touch $(PKG_BUILD_DIR)/include/config/auto.conf
	mkdir -p $(PKG_BUILD_DIR)/include/generated
	touch $(PKG_BUILD_DIR)/include/generated/autoconf.h
	$(call Build/Compile/Default,tools-only_defconfig)
	$(SED) 's/CONFIG_TOOLS_LIBCRYPTO=y/# CONFIG_TOOLS_LIBCRYPTO is not set/' $(PKG_BUILD_DIR)/.config
	$(SED) 's/CONFIG_TOOLS_KWBIMAGE=y/# CONFIG_TOOLS_KWBIMAGE is not set/' $(PKG_BUILD_DIR)/.config
endef

MAKE_FLAGS += \
	TARGET_CFLAGS="$(TARGET_CFLAGS)" \
	TARGET_LDFLAGS="$(TARGET_LDFLAGS)" \
	NO_PYTHON=1 \
	no-dot-config-targets=envtools \
	envtools

define Build/Compile
endef

define Package/uboot-envtools/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tools/env/fw_printenv $(1)/usr/sbin
	$(LN) fw_printenv $(1)/usr/sbin/fw_setenv
	$(INSTALL_BIN) ./uboot-envtools/files/fw_printsys $(1)/usr/sbin
	$(INSTALL_BIN) ./uboot-envtools/files/fw_setsys $(1)/usr/sbin
	$(INSTALL_BIN) ./uboot-envtools/files/fw_loadenv $(1)/usr/sbin
	$(INSTALL_DIR) $(1)/etc/board.d
	$(INSTALL_DATA) ./uboot-envtools/files/fw_defaults $(1)/etc/board.d/05_fw_defaults
	$(INSTALL_DIR) $(1)/lib
	$(INSTALL_DATA) ./uboot-envtools/files/uboot-envtools.sh $(1)/lib
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(if $(wildcard ./uboot-envtools/files/$(BOARD)_$(SUBTARGET)), \
		$(INSTALL_DATA) ./uboot-envtools/files/$(BOARD)_$(SUBTARGET) \
		$(1)/etc/uci-defaults/30_uboot-envtools, \
		$(if $(wildcard ./uboot-envtools/files/$(BOARD)), \
			$(INSTALL_DATA) ./uboot-envtools/files/$(BOARD) \
			$(1)/etc/uci-defaults/30_uboot-envtools \
		) \
	)
endef

$(eval $(call BuildPackage,uboot-envtools))
