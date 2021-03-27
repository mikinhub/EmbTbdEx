
## List of different configurations
CONFIGS := Tiny Mini Medi Huge

## List of targets
TARGETS    := ${CONFIGS}
TARGET     := ${MAKECMDGOALS}
TARGETCNT  := $(words ${TARGET})
ifneq (${TARGETCNT},1)
$(error "Must have 1 target, given ${TARGETCNT}")
endif

## Directory Configuration
OUTDIR := output

## List of Source Files
SRC 	:= $(notdir $(wildcard src/*.c src/**/*.c))
vpath %.c $(wildcard src/ src/*/)

## List of Object Files
OBJS := $(addprefix ${OUTDIR}/${TARGET}/,$(patsubst %.c,%.o,${SRC}))

## CLFAGS
CFLAGS    := ${CFLAGS} -Wall
CFLAGS    := ${CFLAGS} -c
CFLAGS    := ${CFLAGS} $(addprefix -I,$(wildcard */ src/*/))

.PHONY: ${TARGETS}
${TARGETS}: ${OBJS}
	@gcc -o $@ $^
	@echo -e "\n------------------------"
	@echo "Running $@"
	@./$@

# Rules for objects
${OUTDIR}/${TARGET}/%.o: %.c | ${OUTDIR}/${TARGET}
	@gcc ${CFLAGS} -DCFG_${TARGET} $^ -o $@

${OUTDIR}/${TARGET}:
	@mkdir -p $@

# Rule for cleaning
clean:
	@rm -rfv ${OUTDIR} ${TARGETS}
