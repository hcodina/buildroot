################################################################################
#
# tlp_pkgd
#
################################################################################

TLP_PKGD_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_TLP_PKGD_INSTALL_PKGCD),y)
define TLP_PKGD_INSTALL_TARGET_CMDS_FILE_PKGCD
	echo "pkgd: $$(date)" > $(TARGET_DIR)/pkgcd
endef
endif

define TLP_PKGD_INSTALL_TARGET_CMDS
	echo "pkgd: $$(date)" > $(TARGET_DIR)/pkgd1
	echo "pkgd: $$(date)" > $(TARGET_DIR)/pkgd2
	$(TLP_PKGD_INSTALL_TARGET_CMDS_FILE_PKGCD)
endef

define TLP_PKGD_INSTALL_STAGING_CMDS
	echo "pkgd: $$(date)" > $(STAGING_DIR)/pkgd1
	echo "pkgd: $$(date)" > $(STAGING_DIR)/pkgd3
endef

$(eval $(generic-package))
