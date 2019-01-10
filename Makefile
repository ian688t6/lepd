include config.mk

.PHONY:all clean

MODULE := ev
MODULE += busybox-lite
MODULE += customization
MODULE += iopp
MODULE += iotop
MODULE += procrank
MODULE += ps
MODULE += sysstat-lite
MODULES := $(addprefix modules/, $(MODULE))

define modules_build
          for module in $(MODULES) ; do \
               echo $${module} && cd $${module} && $(MAKE) && cd -; \
          done ;
endef

define modules_clean
          for module in $(MODULES) ; do \
               echo $${module} && cd $${module} && $(MAKE) clean && cd -; \
          done ;
endef

.PHONY:all clean cleanall
all:
	@echo "make build lepd"	
	$(call modules_build)
	@make -C server

clean:
	@echo "make clean lepd"	
	$(call modules_clean)
	@make clean -C server
cleanall:clean
	@rm -rf build

