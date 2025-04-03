BINARY := wine wineserver
TARGET := $(addprefix target/, $(BINARY))

bin_box86 := box86
bin_box64 := box64
opt32 := /opt/wine32
opt64 := /opt/wine64
prefix := /usr/local

PREFIX := $(prefix)
BIN_PATH := $(PREFIX)/bin
BIN_FILE := $(addprefix $(BIN_PATH)/,$(BINARY))

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

.PHONY: target_dir
target_dir:
	@mkdir -p target

$(TARGET): target_dir $(TARGET:target/%=%)

$(BINARY): template.c
	$(CC) -DPROG="$@" -DBOX86="$(bin_box86)" -DBOX64="$(bin_box64)" -DOPT32="$(opt32)/bin" -DOPT64="$(opt64)/bin" -O2 $< -o target/$@
