.PHONY:all clean

all:
	@echo "compile libev"
	@cd libev;./configure --host=$(HOST) CC=$(CROSS_COMPILE)gcc --prefix=$(LEPD_BUILD);make;make install;cd -;		

clean:
	@echo "clean libev"
	@cd libev;make distclean;
