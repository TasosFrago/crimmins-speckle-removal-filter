CC = clang

FLAGS = -Wall -fcolor-diagnostics -fansi-escape-codes -Werror -fsanitize=address -fno-omit-frame-pointer -std=c99 -fopenmp=libomp


INCLUDES = -I./src/

FLAGS += $(INCLUDES)

C_SRCS = ./src/speckle_removal.c \
	 ./src/utils.c \
	 ./src/crimmins.c \
	 ./src/test.c

C_OBJS = $(C_SRCS:.c=.o)

TARGET = speckle

all: $(TARGET)

$(TARGET): $(C_OBJS)
	$(CC) $(FLAGS) $^ -o $@

%.o: %.c
	$(CC) $(FLAGS) -c $< -o $@

.PHONY: clean

clean:
	rm $(TARGET)
	rm $(C_OBJS)
