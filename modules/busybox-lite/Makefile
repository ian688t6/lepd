DIR_INC = inc
DIR_SRC = src

SRC = $(wildcard ${DIR_SRC}/*.c)  
OBJ = $(patsubst %.c,${DIR_SRC}/%.o,$(notdir ${SRC})) 

TARGET = libbusybox.a
 
CFLAGS += -I$(DIR_INC) -Wall -static

${TARGET}:${OBJ}
	$(AR) rc $@ $^ 
	@cp $(TARGET) $(LEPD_BUILD)/lib
${DIR_SRC}/%.o:${DIR_SRC}/%.c
	$(CC) $(CFLAGS) -c  $< -o $@

.PHONY:clean
clean:
	@rm -rf $(DIR_SRC)/*.o
	@rm -rf *.a
