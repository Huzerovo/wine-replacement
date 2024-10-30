TARGET32 := wine
TARGET64 := wine64
TARGET_MIX := wineserver

TARGET := $(TARGET32) $(TARGET64) $(TARGET_MIX)

BIN_PATH := $(PREFIX)/usr/local/bin
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
	$(CC) -DBOX86 -DPROG="$@" -O0 $< -o $@

$(TARGET64): template.c
	$(CC) -DBOX64 -DPROG="$@" -O0 $< -o $@

$(TARGET_MIX): template_mix.c
	$(CC) -DBOXMIX -DPROG="$@" -O0 $< -o $@
