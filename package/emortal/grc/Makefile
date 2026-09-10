include $(TOPDIR)/rules.mk

PKG_NAME:=grc
PKG_VERSION:=1.13
PKG_RELEASE:=1

PKG_SOURCE:=v$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/garabik/grc/archive/refs/tags
PKG_HASH:=a7b10d4316b59ca50f6b749f1d080cea0b41cb3b7258099c3eb195659d1f144f
PKG_SOURCE_SUBDIR:=grc-$(PKG_VERSION)

PKG_MAINTAINER:=OpenWrt Maintainers
PKG_LICENSE:=GPL-2.0-or-later
PKG_LICENSE_FILES:=debian/copyright

include $(INCLUDE_DIR)/package.mk

define Package/grc
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Generic Colouriser
  URL:=https://github.com/garabik/grc
  DEPENDS:=+python3-light
  PKGARCH:=all
endef

define Package/grc/description
 Generic Colouriser for command output with ash, bash and zsh integration.
endef

define Package/grc/postinst
#!/bin/sh
rm -f "$${IPKG_INSTROOT}/etc/profile.d/grc.sh"
exit 0
endef

define Build/Compile
endef

define Package/grc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(SED) 's#/etc/grc.conf#/usr/share/grc/grc.conf#g' $(PKG_BUILD_DIR)/grc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grc $(1)/usr/bin/grc
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/grcat $(1)/usr/bin/grcat

	$(INSTALL_DIR) $(1)/usr/share/grc
	$(CP) $(PKG_BUILD_DIR)/colourfiles/conf.* $(1)/usr/share/grc/
	$(INSTALL_DATA) ./files/conf.nft $(1)/usr/share/grc/conf.nft
	$(SED) 's#/etc/default/grc#/usr/share/grc/grc.default#g' $(PKG_BUILD_DIR)/grc.sh
	$(SED) 's#tty -s#[ -t 1 ]#g; s#which grc#command -v grc#g' $(PKG_BUILD_DIR)/grc.sh
	grep -qs "alias nft=" $(PKG_BUILD_DIR)/grc.sh || $(SED) "/alias iptables=/a\\    alias nft='grc --colour=on -es -c conf.nft nft'" $(PKG_BUILD_DIR)/grc.sh
	grep -qs "alias ping6=" $(PKG_BUILD_DIR)/grc.sh || $(SED) "/alias ping=/a\\    alias ping6='colourify ping6'" $(PKG_BUILD_DIR)/grc.sh
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/grc.conf $(1)/usr/share/grc/grc.conf
	printf '%s\n' '^nft' conf.nft >> $(1)/usr/share/grc/grc.conf
	$(INSTALL_DATA) ./files/grc.default $(1)/usr/share/grc/grc.default
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/grc.sh $(1)/usr/share/grc/grc.sh
	$(SED) 's#tty -s#[ -t 1 ]#g' $(PKG_BUILD_DIR)/grc.zsh
	grep -qs '^  nft' $(PKG_BUILD_DIR)/grc.zsh || $(SED) '/^  iptables/a\  nft' $(PKG_BUILD_DIR)/grc.zsh
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/grc.zsh $(1)/usr/share/grc/grc.zsh

	$(INSTALL_DIR) $(1)/etc/profile.d
	$(INSTALL_DATA) ./files/grc-profile.sh $(1)/etc/profile.d/92-grc.sh
endef

$(eval $(call BuildPackage,grc))
