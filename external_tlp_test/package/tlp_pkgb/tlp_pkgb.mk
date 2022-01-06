################################################################################
#
# tlp_pkgb
#
################################################################################

TLP_PKGB_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_TLP_PKGA_INSTALL_PKGAB),y)
define TLP_PKGB_INSTALL_TARGET_CMDS_FILE_PKGAB
	echo "pkgb: $$(date)" > $(TARGET_DIR)/pkgab
endef
endif

define TLP_PKGB_INSTALL_TARGET_CMDS
	echo "pkgb: $$(date)" > $(TARGET_DIR)/pkgb1
	echo "pkgb: $$(date)" > $(TARGET_DIR)/pkgb2
	$(TLP_PKGB_INSTALL_TARGET_CMDS_FILE_PKGAB)
endef

define TLP_PKGB_INSTALL_STAGING_CMDS
	echo "pkgb: $$(date)" > $(STAGING_DIR)/pkgb1
	echo "pkgb: $$(date)" > $(STAGING_DIR)/pkgb3
endef

$(eval $(generic-package))