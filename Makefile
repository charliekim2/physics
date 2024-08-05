CC = gcc
CFLAGS = -Wall -std=c99

LIB_DIR = src/lib
INCLUDE_DIR = src/include
GLFW = glfw3
OPEN_GL = opengl32
GDI = gdi32

OUTPUT = main.exe

SRC_DIR = src
SRC = $(wildcard $(SRC_DIR)/*.c)
OBJ = $(SRC:.c=.o)

all: $(OUTPUT)

$(OUTPUT): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^ -L $(LIB_DIR) $(LDFLAGS) -l$(GLFW) -l$(OPEN_GL) -l$(GDI)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $< -I $(INCLUDE_DIR)

debug: CFLAGS += -DDEBUG -O0 -g
debug: clean $(OUTPUT)

clean:
	rm -f $(OBJ) $(OUTPUT)
