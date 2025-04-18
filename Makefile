# Default to clang, but allow override via `make COMPILER=gcc`
FLAGS = -Wall -Werror -std=c99
ifeq ($(COMP),gcc)
  CC = gcc
  FLAGS += -Wno-unknown-pragmas -fopenmp
else
  CC = clang
  FLAGS += -fsanitize=address -fcolor-diagnostics -fansi-escape-codes -fno-omit-frame-pointer -fopenmp=libomp
endif

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
	$(CC) $(FLAGS) $(LLFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(FLAGS) -c $< -o $@

.PHONY: clean

clean:
	rm -f $(TARGET)
	rm -f $(C_OBJS)
