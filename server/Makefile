DIR_INC = inc
DIR_SRC = src

SRC = $(wildcard ${DIR_SRC}/*.c)
OBJ = $(patsubst %.c,${DIR_SRC}/%.o,$(notdir ${SRC})) 

CFLAGS +=  -I./inc -D_BUILTIN_FUNC
ifeq ($(ARCH), x86)
LDFLAG := -Wl,-dn -L$(LEPD_BUILD)/lib -lev -lbusybox -lcus -liopp -liotop -lprocrank -lps -lsysstat -Wl,-dy -lm -lrt
else
LDFLAG := -static -Wl,-dn -L$(LEPD_BUILD)/lib -lev -lbusybox -lcus -liopp -liotop -lprocrank -lps -lsysstat -lm -lrt
endif
TARGET = lepd

${TARGET}:${OBJ}
	$(CC) $^ -o $@ $(CFLAGS) $(LDFLAG) 
	@cp $@ $(LEPD_BUILD)/bin

${DIR_SRC}/%.o:${DIR_SRC}/%.c
	$(CC) -c $(CFLAGS) $< -o $@ 

.PHONY:clean
clean:
	@rm -rf $(DIR_SRC)/*.o
	@rm $(TARGET)
