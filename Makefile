CC      := gcc
TARGET  := build/target

SRC_DIR := src
BUILD_DIR := build

SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRC))

CSTD    := -std=c99

WARN    := -Wall -Wextra -Werror \
           -Wpedantic \
           -Wshadow \
           -Wpointer-arith \
           -Wcast-qual \
           -Wstrict-prototypes \
           -Wmissing-prototypes \
           -Wconversion \
           -Wsign-conversion \
           -Wundef

SECURITY := -fstack-protector-strong \
            -D_FORTIFY_SOURCE=2 \
            -fno-common

OPT     := -O2

CFLAGS  := $(CSTD) $(WARN) $(SECURITY) $(OPT)
LDFLAGS := -Wl,-z,relro,-z,now

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJ)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(OBJ) $(LDFLAGS) -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)
