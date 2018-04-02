PROJ = simple_ray_tracer

IDIR = include
SRCDIR = src
OBJDIR = build/obj
BUILDDIR = build
LDIR = lib

CC = clang
CFLAGS = -I$(IDIR)

LIBS =

_DEPS = defines.h window.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o
OBJ = $(patsubst %,$(OBJDIR)/%,$(_OBJ))

$(OBJDIR)/%.o : $(SRCDIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

build : $(OBJ)
	$(CC) -o $(BUILDDIR)/$(PROJ) $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -r $(BUILDDIR)
	mkdir $(BUILDDIR)
	mkdir $(OBJDIR)
