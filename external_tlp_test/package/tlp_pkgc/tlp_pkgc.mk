################################################################################
#
# tlp_pkgc
#
################################################################################

TLP_PKGC_INSTALL_STAGING = YES
TLP_PKGC_DEPENDENCIES = tlp_pkga tlp_pkgb

ifeq ($(BR2_PACKAGE_TLP_PKGC_OVERWRITE_PKGA),y)
define TLP_PKGC_INSTALL_TARGET_CMDS_OVERWRITE_PKGA
	echo "pkgc: $$(date)" > $(TARGET_DIR)/pkga1
endef
endif

ifeq ($(BR2_PACKAGE_TLP_PKGC_INSTALL_PKGCD),y)
define TLP_PKGC_INSTALL_TARGET_CMDS_FILE_PKGCD
	echo "pkgc: $$(date)" > $(TARGET_DIR)/pkgcd
endef
endif

define TLP_PKGC_INSTALL_TARGET_CMDS
	echo "pkgc: $$(date)" > $(TARGET_DIR)/pkgc1
	echo "pkgc: $$(date)" > $(TARGET_DIR)/pkgc2
	$(TLP_PKGC_INSTALL_TARGET_CMDS_OVERWRITE_PKGA)
	$(TLP_PKGC_INSTALL_TARGET_CMDS_FILE_PKGCD)
endef

define TLP_PKGC_INSTALL_STAGING_CMDS
	echo "pkgc: $$(date)" > $(STAGING_DIR)/pkgc1
	echo "pkgc: $$(date)" > $(STAGING_DIR)/pkgc3
endef

$(eval $(generic-package))
