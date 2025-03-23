TARGET32 := wine
TARGET64 := wine64
TARGET_MIX := wineserver

TARGET := $(TARGET32) $(TARGET64) $(TARGET_MIX)

opt32 := /opt/wine32
opt64 := /opt/wine64
prefix := /usr/local

PREFIX := $(prefix)
BIN_PATH := $(PREFIX)/bin
BIN_FILE := $(TARGET:%=$(BIN_PATH)/%)

.PHONY: all
all: $(TARGET)

.PHONY: clean
clean:
	rm -f $(TARGET)

.PHONY: install
install: $(TARGET)
	install -t $(BIN_PATH) $(TARGET)

.PHONY: uninstall
uninstall:
	rm -f $(BIN_FILE)

$(TARGET32): template.c
	$(CC) -DBOX86 -DPROG="$@" -DOPT32="$(opt32)/bin" -DOPT64="$(opt64)/bin" -O0 $< -o $@

$(TARGET64): template.c
	$(CC) -DBOX64 -DPROG="$@" -DOPT32="$(opt32)/bin" -DOPT64="$(opt64)/bin" -O0 $< -o $@

$(TARGET_MIX): template_mix.c
	$(CC) -DBOXMIX -DPROG="$@" -DOPT32="$(opt32)/bin" -DOPT64="$(opt64)/bin" -O0 $< -o $@
