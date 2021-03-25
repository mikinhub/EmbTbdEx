
## List of different configurations
CONFIGS := ${CONFIGS} Tiny
CONFIGS := ${CONFIGS} A
CONFIGS := ${CONFIGS} B
CONFIGS := ${CONFIGS} Huge

## List of targets
TARGETS    := $(addprefix fw_,${CONFIGS})
CLEANFILES := ${CLEANFILES} ${TARGETS}

## List of Source Files
SRC := $(wildcard src/*.c src/**/*.c)

## List of Object Files
OBJS_Tiny  := $(patsubst %.c,%_Tiny.o,${SRC})
OBJS_A     := $(patsubst %.c,%_A.o,${SRC})
OBJS_B     := $(patsubst %.c,%_B.o,${SRC})
OBJS_Huge  := $(patsubst %.c,%_Huge.o,${SRC})
CLEANFILES := ${CLEANFILES} ${OBJS_Tiny} ${OBJS_A} ${OBJS_B} ${OBJS_Huge}

## CLFAGS
CFLAGS    := ${CFLAGS} -Wall
CFLAGS    := ${CFLAGS} -c
CFLAGS    := ${CFLAGS} $(addprefix -I,$(wildcard src/*/))

all: ${TARGETS}

fw_Tiny: ${OBJS_Tiny}

fw_A: ${OBJS_A}

fw_B: ${OBJS_B}

fw_Huge: ${OBJS_Huge}

%_Tiny.o: %.c
	gcc ${CFLAGS} -DCFG=Tiny $^ -o $@

clean:
	rm -f ${CLEANFILES}
