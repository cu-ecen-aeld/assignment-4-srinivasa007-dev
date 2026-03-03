##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = main
AESD_ASSIGNMENTS_SITE = git@github.com:srinivasa007-dev/assignments-3-and-later-srinivasa007-dev.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

# Build inside the finder-app folder
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" -C $(@D)/finder-app
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install writer
	$(INSTALL) -D -m 0755 $(@D)/finder-app/writer \
		$(TARGET_DIR)/usr/bin/writer

	# Install finder.sh
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder.sh \
		$(TARGET_DIR)/usr/bin/finder.sh

	# Install finder-test.sh
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder-test.sh \
		$(TARGET_DIR)/usr/bin/finder-test.sh

	# Install config directory
	mkdir -p $(TARGET_DIR)/etc/finder-app
	cp -r $(@D)/finder-app/conf $(TARGET_DIR)/etc/finder-app/
endef

$(eval $(generic-package))
