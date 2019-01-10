DIR_INC = inc
DIR_SRC = src

SRC = $(wildcard ${DIR_SRC}/*.c)  
OBJ = $(patsubst %.c,${DIR_SRC}/%.o,$(notdir ${SRC})) 

TARGET = libps.a
CFLAGS += -lbusybox -I$(DIR_INC) -Wall -static -std=c99 -DPACKAGE_VERSION="1.0" -D_GNU_SOURCE
LDFLAG := -L$(LEPD_BUILD)/lib

${TARGET}:${OBJ}
	$(AR) rc $@ $^ 
	@cp $(TARGET) $(LEPD_BUILD)/lib
${DIR_SRC}/%.o:${DIR_SRC}/%.c
	$(CC) $(CFLAGS) $(LDFLAG) -c  $< -o $@

.PHONY:clean
clean:
	@rm -rf $(DIR_SRC)/*.o
	@rm -rf *.a
