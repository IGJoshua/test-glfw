PROJ = simple_ray_tracer

IDIR = include
SRCDIR = src
OBJDIR = build/obj
BUILDDIR = build
LDIR = lib

CC = clang
CFLAGS = -I$(IDIR)

LIBS =

_DEPS = maths.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o
OBJ = $(patsubst %,$(OBJDIR)/%,$(_OBJ))

$(OBJDIR)/%.o : $(SRCDIR)/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

build : $(OBJ)
	$(CC) -o $(BUILDDIR)/$(PROJ) $^ $(CFLAGS) $(LIBS)
