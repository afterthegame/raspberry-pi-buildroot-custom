MYKMOD_VERSION = 1.0
MYKMOD_SOURCE = mykmod-$(MYKMOD_VERSION).tar.bz2
MYKMOD_SITE = http://somewhere.com/

MYKMOD_DEPENDENCIES = linux

define MYKMOD_BUILD_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
endef

define MYKMOD_INSTALL_TARGET_CMDS
	$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
endef

#$(eval $(call GENTARGETS,package,mykmod))
$(eval $(kernel-module))
$(eval $(generic-package))