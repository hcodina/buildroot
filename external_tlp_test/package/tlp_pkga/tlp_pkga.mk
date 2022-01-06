################################################################################
#
# tlp_pkga
#
################################################################################

TLP_PKGA_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_TLP_PKGA_INSTALL_PKGAB),y)
define TLP_PKGA_INSTALL_TARGET_CMDS_FILE_PKGAB
	echo "pkga: $$(date)" > $(TARGET_DIR)/pkgab
endef
endif

define TLP_PKGA_INSTALL_TARGET_CMDS
	echo "pkga: $$(date)" > $(TARGET_DIR)/pkga1
	echo "pkga: $$(date)" > $(TARGET_DIR)/pkga2
	$(TLP_PKGA_INSTALL_TARGET_CMDS_FILE_PKGAB)
endef

define TLP_PKGA_INSTALL_STAGING_CMDS
	echo "pkga: $$(date)" > $(STAGING_DIR)/pkga1
	echo "pkga: $$(date)" > $(STAGING_DIR)/pkga3
endef

$(eval $(generic-package))
