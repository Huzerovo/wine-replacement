
TARGET32 := wine
TARGET64 := wine64 wineserver

TARGET := $(TARGET32) $(TARGET64)

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
