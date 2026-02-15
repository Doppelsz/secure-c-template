CC          := gcc
TARGET      := build/target

SRC_DIR     := src
BUILD_DIR   := build

SRC         := $(wildcard $(SRC_DIR)/*.c)
OBJ         := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRC))

CSTD        := -std=c11

WARN        := -Wall -Wextra -Werror -Wpedantic \
               -Wshadow \
               -Wconversion -Wsign-conversion \
               -Wformat=2 \
               -Wundef \
               -Wpointer-arith \
               -Wcast-qual \
               -Wstrict-prototypes \
               -Wmissing-prototypes \
               -Wvla \
               -Wnull-dereference \
               -Wdouble-promotion \
               -Wimplicit-fallthrough

SECURITY    := -fstack-protector-strong \
               -fstack-clash-protection \
               -D_FORTIFY_SOURCE=3 \
               -fPIE \
               -fno-common

LDFLAGS_SEC := -Wl,-z,relro,-z,now \
               -Wl,-z,noexecstack \
               -Wl,-z,separate-code \
               -pie

OPT         := -O2

DEBUG_FLAGS := -g3 -O0 \
               -fsanitize=address,undefined \
               -fno-omit-frame-pointer

CFLAGS      := $(CSTD) $(WARN) $(SECURITY) $(OPT)
LDFLAGS     := $(LDFLAGS_SEC)

.PHONY: all clean debug release

all: release

release: CFLAGS := $(CSTD) $(WARN) $(SECURITY) $(OPT)
release: LDFLAGS := $(LDFLAGS_SEC)
release: $(TARGET)

debug: CFLAGS := $(CSTD) $(WARN) $(DEBUG_FLAGS)
debug: LDFLAGS :=
debug: clean $(TARGET)

$(TARGET): $(OBJ)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(OBJ) $(LDFLAGS) -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)
