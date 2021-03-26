
## List of different configurations
CONFIGS := ${CONFIGS} Tiny
CONFIGS := ${CONFIGS} Mini
CONFIGS := ${CONFIGS} Medi
CONFIGS := ${CONFIGS} Huge

## List of targets
TARGETS    := $(addprefix fw_,${CONFIGS})
CLEANFILES := ${CLEANFILES} ${TARGETS}

## List of Source Files
SRC := $(wildcard src/*.c src/**/*.c)

## List of Object Files
OBJS_Tiny  := $(patsubst %.c,%_Tiny.o,${SRC})
OBJS_Mini  := $(patsubst %.c,%_Mini.o,${SRC})
OBJS_Medi  := $(patsubst %.c,%_Medi.o,${SRC})
OBJS_Huge  := $(patsubst %.c,%_Huge.o,${SRC})
CLEANFILES := ${CLEANFILES} ${OBJS_Tiny} ${OBJS_Mini} ${OBJS_Medi} ${OBJS_Huge}

## CLFAGS
CFLAGS    := ${CFLAGS} -Wall
CFLAGS    := ${CFLAGS} -c
CFLAGS    := ${CFLAGS} $(addprefix -I,$(wildcard */ src/*/))

all: ${TARGETS}

# Rules for targets
.PHONY: fw_Tiny
fw_Tiny: ${OBJS_Tiny}
	@gcc -o $@ $^
	@echo "Running $@"
	@./$@

.PHONY: fw_Mini
fw_Mini: ${OBJS_Mini}
	@gcc -o $@ $^
	@echo "Running $@"
	@./$@


.PHONY: fw_Medi
fw_Medi: ${OBJS_Medi}
	@gcc -o $@ $^
	@echo "Running $@"
	@./$@

.PHONY: fw_Huge
fw_Huge: ${OBJS_Huge}
	@gcc -o $@ $^
	@echo "Running $@"
	@./$@

# Rules for objects
%_Tiny.o: %.c
	@gcc ${CFLAGS} -DCFG_Tiny $^ -o $@

%_Mini.o: %.c
	@gcc ${CFLAGS} -DCFG_Mini $^ -o $@

%_Medi.o: %.c
	@gcc ${CFLAGS} -DCFG_Medi $^ -o $@

%_Huge.o: %.c
	@gcc ${CFLAGS} -DCFG_Huge $^ -o $@

# Rule for cleaning
clean:
	rm -f ${CLEANFILES}
